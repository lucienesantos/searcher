# SEARCHER

This is a realtime search box, where users search articles. Every search is saved for a future analyse and trend.

## How to run

Install required gems 

`bundle install`

Run migrations

`rake db:migrate`

Run rails

`rails s`

In another terminal window, run:

`bundle exec sidekiq`

Make sure you have **Redis** installed and running

## Tests

Run all tests with

`rspec`

Check code coverage at */coverage* on root folder.

## DEMO

If you want to see a demo, try this heroku link: https://searcher-help.herokuapp.com/

## URLS

/ - Home - Where you make a realtime search

/statistics - Search Statistics - Where you can analyze what is most searched

## Gems

This app is a basic rails app, however some cool gems are required:

* Rspec - Best way to do your tests

* Factory Girl - fixtures replacement 

* shoulda-matchers - for model validations

* simplecov - for test code coverage

* database_cleaner - clean database whenever tests run

* Sidekiq - Best gem for delayed jobs with scaling

