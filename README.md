# Simple REST API

This repo contains the code from the talk: "Building a simple REST API in Ruby On Rails", presented on February 27th.

## Pre-requisites (without using Docker)

* [RVM](https://rvm.io/) (Ruby Version Manager)
* Ruby v2.6.0
* Ruby on Rails v6.0.0
* MySQL 5.7.24

## Set up
* Install gems with `bundle install`
* Set up database with 
    * `rails db:setup`
    * `raills db:migrate`

## Run server
`rails server`

## Run Tests 
As simple as running `rspec`


## Run with Docker Compose
The app will be available in localhost:3001

* `docker-compose build`
* `docker-compose up -d`

## Start making requests!
You can user [POSTMAN](https://www.postman.com/) or any tool you prefer (even cURL)

