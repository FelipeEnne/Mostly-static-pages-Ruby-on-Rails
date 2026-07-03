# Sample App (Ruby on Rails Tutorial)

Sample application from [*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/) by [Michael Hartl](https://www.michaelhartl.com/), upgraded to a supported Rails stack with current dependency security patches.

## Stack

- Ruby 3.2+ (developed with 3.4.9)
- Rails 8.1
- SQLite (development/test), PostgreSQL (production)
- Puma, Sprockets, Bootstrap 3.4.1, Turbo, CarrierWave, MiniMagick

Dependencies were updated from the original Rails 5.1 tutorial pins to remove known CVEs (Rails, Rack, Puma, Nokogiri, bootstrap-sass, CarrierWave, and related gems).

## Prerequisites

- Ruby 3.2 or newer (RubyInstaller+Devkit on Windows)
- Bundler 2.x
- SQLite 3
- ImageMagick (optional in development; used by MiniMagick to resize micropost pictures)

## Getting started

Clone the repository and install gems:

```bash
bundle install
```

Prepare the database:

```bash
bin/rails db:prepare
```

Run the test suite:

```bash
bin/rails test
```

Start the local server:

```bash
bin/rails server
```

Then open [http://localhost:3000](http://localhost:3000).

You can also run `bin/setup` to install dependencies and prepare the database in one step.

## Production environment variables

| Variable | Purpose |
| --- | --- |
| `SECRET_KEY_BASE` | Rails secret key (required) |
| `DATABASE_URL` | PostgreSQL connection URL |
| `APP_HOST` | Public hostname for mailer links |
| `SENDGRID_USERNAME` / `SENDGRID_PASSWORD` | SMTP delivery via SendGrid |
| `SENDGRID_DOMAIN` | SendGrid domain (defaults to `heroku.com`) |
| `S3_ACCESS_KEY` / `S3_SECRET_KEY` | AWS credentials for CarrierWave uploads |
| `S3_BUCKET` | S3 bucket name |
| `S3_REGION` | AWS region (defaults to `us-east-1`) |

Generate a secret with:

```bash
bin/rails secret
```

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/) is available jointly under the MIT License and the Beerware License. See [LICENSE.md](LICENSE.md) for details.

For more information, see the [*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
