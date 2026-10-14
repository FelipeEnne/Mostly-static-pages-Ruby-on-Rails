class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)

  def new
  end

  def create
    email = params.dig(:password_reset, :email).to_s.downcase
    @user = User.find_by(email: email)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
    end

    # Keep the response identical whether or not the address has an account.
    flash[:info] = "If that email address is registered, password reset instructions will be sent."
    redirect_to root_url
  end

  def edit
  end

  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update(user_params)          # Case (4)
      # A password reset invalidates both reset links and existing remembered
      # sessions so a stolen persistent cookie cannot survive the reset.
      @user.update_columns(reset_digest: nil, reset_sent_at: nil, remember_digest: nil)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'                                     # Case (2)
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

     # Checks expiration of reset token.
     def check_expiration
      if @user.nil? || @user.reset_sent_at.nil? || @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
