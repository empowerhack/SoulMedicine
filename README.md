# Soul Medicine

Soul Medicine is a free micro learning, SMS based service helping refugees. It is a project that is built in collaboration of Empowerhack and Chayn. Whilst still in development, this repository will change drastically. Feel free to help out by reaching us at hello @ soulmedicine.io

## Local development

1. Clone this repository `git clone git@github.com:empowerhack/SoulMedicine.git`
1. Navigate to the cloned repository `cd SoulMedicine`
1. Copy the secrets file and the database configuration files
 1. `cp config\secrets-example.yml config\secrets.yml`
 1. `cp config\database-example.yml config\database.yml`
1. Fill in the necessary information in these files _(open an issue here if you need help)_
1. Run `bundle install`
1. Run `rake db:create`
1. Run `rake db:migrate`
1. Run `rake db:seed`
1. Run `rails s` to start the local server
1. You should see the site available at `localhost:3000` and the admin section at `localhost:3000/admin`
1. You can login to the admin site by using `admin@example.com / password`