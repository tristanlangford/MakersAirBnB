# MakersAirBnB

## What is MakersAirBnB?

This is a team project created in response to the [Makers BnB challenge](https://github.com/tristanlangford/MakersAirBnB/blob/master/CHALLENGE.md). In the space of a week, we created an Airbnb clone that allowed a user to list a space, view a property, make a booking, and confirm that booking. 

There were four people in the team - Tristan, Katie, Chris, and Nikita. The main goal of the week was to work as a team for the first time, and so we've detailed both our approach to challenge and our approach to teamwork [here](https://github.com/tristanlangford/MakersAirBnB/blob/master/PROCESS.md). 

## How to use MakersAirBnB?

## How to use the app?

MakersBnB is a web app built with Ruby; it uses Sinatra as its web framework. In order to try out the app, please go through the following steps:

1. Clone the app using the green **Clone or Download** button above.
2. Install bundler (take a look [here](https://bundler.io/) if you don't know how to do that) and then run `bundle` to install the dependencies.
4. Open the `db/migrations` file, and run the commands in `psql`, the [command-line front-end for PostgreSQL](http://postgresguide.com/utilities/psql.html).
3. In the app's root directory, run `rackup` on the command line to start the server.
4. Visit http://localhost:9292 in your browser to try out the app - you'll need to hit the "Sign up" button on the landing page to explore the site.

### How to run the tests?

We used TDD to build this app and wrote our tests using RSpec and Capybara. When you're in the app's root directory run `rspec` on the command line run the tests. 
