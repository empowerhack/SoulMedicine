# Local development

## Requirements

* Ruby 2.3.1
* Rails 4.2.4
* Redis Server
* MySQL Server

## Build Steps

1. Clone this repository `git clone git@github.com:empowerhack/SoulMedicine.git`
1. Navigate to the cloned repository `cd SoulMedicine`
1. Copy the environment file  `cp .env.sample .env`
 1. Fill in the necessary information in this file _(open an issue here if you need help)_
1. Run `bundle install`
1. Run `rake db:create`
1. Run `rake db:migrate`
1. Run `rake db:seed`
1. Run `rails s` to start the local server
1. In a separate terminal, run `bundle exec sidekiq` to run the background processes
1. You should see the site available at `localhost:3000` and the admin section at `localhost:3000/admin`
1. You can login to the admin site by using `admin@example.com / password`