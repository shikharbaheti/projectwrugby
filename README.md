# README

## Introduction ##

This website is for the TAMU Women's Rugby Teams officer. It allows them to keep track of all types of people in the network such as Players, Alumni, and Recruits. As well as keep track of merchendise/transactions and events/attendance for each person.

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/your_github_here.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd your_github_here`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd csce431`
    
Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

Organization members will have access to organization email that will act as the primary environmental variable. This email will be used for signing in using Google OAuth. 

## Deployment ##

The Github link will be provided to the customer. The customer will be guided through creating their own Heroku account. The customer will use the github link to deploy the application using their account. The customer can then configure the link to the site according to their wishes. 

## Environmental Variables/Files ##

Google OAuth2 support requires two keys to function as intended: Client ID and Client Secret

In both `config/environments/test.rb` as well as `config/environments/development.rb`, change following lines based on your Google OAuth2 Client ID and Client Secret:

  `GOOGLE_OAUTH_CLIENT_ID: 'YOUR_GOOGLE_OAUTH_CLIENT_ID_HERE'`

  `GOOGLE_OAUTH_CLIENT_SECRET: 'YOUR_GOOGLE_OAUTH_CLIENT_SECRET_HERE'`
  
Furthermore to change the 'ADMIN' email to log into the application, you can choose to do so at `app/models/admin.rb` at `return nil unless email =~ /email_here\z/`

## CI/CD ##

Continious Integration is facilitated by maintaining an updated github repository which will then be deployed automatically and continously by Heroku as it recieves updates, allowing for continous and seamless improvements to the application. 

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.
