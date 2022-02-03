# Contact List

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This project was built as an assignment for a trainee program. It works as a contact list using database SQlite3.
	
## Technologies
Project is created with:
* Ruby: 3.1.0
* Rails: 6.1.4 (https://guides.rubyonrails.org/v6.1.4.4/index.html)
* Built in database SQlite3: 1.4
* RSpec - Rails: 5.0.0 (https://rspec.info/)
* FactoryBot: 6.2.0 (https://github.com/thoughtbot/factory_bot_rails)
* rvm: 1.29.12  (https://rvm.io/rvm/install)
	
## Setup
To run this project, make sure you have all technologies above previously installed (follow links above if necessary):

* Clone repository using

```
$ git clone https://github.com/ivopozzani/contact_list.git

```
* Navigate to ./contact_list
* Run bundle install

```
$ bundle install

```
* As it stands, this project will run on console only.
* Run Rails

```
$ bin/rails console

```

* To run rspec test navigate to ./contact_list then run command below (it should return you a report with all examples and failures)

```
$ rspec

```
