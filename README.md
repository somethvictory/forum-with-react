# README

Forum is a very simple project that allows the users to view, ask and answer the questions. This project is build on top of Ruby on Rails and ReactJS.

### Demo
https://morning-wildwood-71350-0d4582ee52d5.herokuapp.com/
### Requirements

- Ruby >= 3.2.1
- Rails >= 7.0.7.2

### Setup
- clone this repo
- cd into the cloned repo
- run `bundle install`
- run `rails db:create`
- run `rails db:migrate`
- run `rails server`

Open browser and navigate to `localhost:3000`

### Features

  * The user is able to view questions and answers by other users
  * The user is able to search all the questions
  * The user is allowed to sign up with only email and password required. The email and passowrd will be used to sign in later
  * Signed in user is allowed to edit his own questions and answers

### Test
- To run all test, run `rake` or `rspec`
