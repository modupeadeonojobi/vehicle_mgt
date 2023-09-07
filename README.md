# Vehicle Management API 

It offers endpoints for listing vehicles, creating new ones, viewing individual vehicle details, updating vehicle information, and deleting vehicles while requiring user authentication for security.

## Install

#### Prerequisites

The setups steps expect following tools installed on the system.

- Docker
- Ruby [3.2.2](https://www.ruby-lang.org/en/downloads/)
- Rails [7.0.5](https://rubyonrails.org/)

##### 1. Check out the repository

```bash
git clone git@github.com:modupeadeonojobi/vehicle_mgt
cd vehicle_mgt
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create db:migrate db:seed
```

##### 4. Install the required gems using Bundler

Run the following commands to install the necessary gems.

```ruby
bundle install
```


##### 5. Add env file

This project uses .env file. Create .env file in the root directory and add the following details. Do not update the DBHOST

```env
DBHOST=
DBUSER=
DBPASS=
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
PGADMIN_DEFAULT_EMAIL=
PGADMIN_DEFAULT_PASSWORD=
```


##### 6. Start the Rails server

You can start the rails server using the command given below.

```ruby
docker-compose build && docker-compose up
```

And now you can visit the site with the URL http://localhost:3000