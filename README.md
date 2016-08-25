# Soul Medicine

Soul Medicine is a free micro learning, SMS based service helping refugees. It is a project that is built in collaboration with Empowerhack and Chayn. Whilst still in development, this repository will change drastically. Feel free to help out by reaching us at `hello<At>soulmedicine.io`

## Contribute to the project

Send an email to `hello<AT>soulmedicine.io` to learn more about how you can contribute to the project. We are constantly looking for more developers, project managers, content producers, and content translators. If you wish, you can also contribute monetarily, which helps support the costs of running the server and continued development.

## Have Ideas or Run into Issues?

Create a GitHub issue [here](https://github.com/empowerhack/SoulMedicine/issues) and let us know!

## Local development

### Requirements

* Ruby 2.3.1
* Rails 4.2.4
* Redis Server
* MySQL Server

### Build Steps

1. Clone this repository `git clone git@github.com:empowerhack/SoulMedicine.git`
1. Navigate to the cloned repository `cd SoulMedicine`
1. Copy the environment file  `cp .env.sample .env`
 1. Fill in the necessary information in this file _(open an issue here if you need help)_
1. Run `bundle install`
1. Run `rake db:create`
1. Run `rake db:migrate`
1. Run `rake db:seed`
1. Run `rails s` to start the local server
1. In a seperate terminal, run `bundle exec sidekiq` to run the background processes
1. You should see the site available at `localhost:3000` and the admin section at `localhost:3000/admin`
1. You can login to the admin site by using `admin@example.com / password`