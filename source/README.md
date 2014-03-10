[Problem statement](https://github.com/sumosized/challenge-rails)
- - -
**Setup**

- `bundle install`
- `rake db:create`
- `rake db:migrate`
- Create a file `config/application.yml` and set your environment variables "PUSHER_APP_URL", "PUSHER_APP_KEY" accordingly
- `rails s` to start server
- Open *http://localhost:3000/* in a web browser
 - To run test cases: `bundle exec rspec`
- - -
**Description**

The solution is based on Ruby 2.0 and Rails 4.0.2.

Following gems are used:

- *sqlite3*
- *rails 4.0.2*
- *factory_girl_rails*
- *rspec-rails*
- *capybara*
- *therubyracer*
- *less-rails*
- *twitter-bootstrap-rails*
- *figaro*
- *vcr*
- - -
**A few comments**

- When 'Crawl!' button is clicked, the screen seem to be stuck for a while due to turbolinks. Wait for a few seconds and the page will show the content. An activity indicator can be added while the data is being loaded.
- As user cannot create/update/delete offers so its related actions are not implemented.
- `/app/model/offer_fetcher.rb` is the class to handle API integration.
- `/fixtures/vcr_cassettes/` has offers that will be used in tests.

