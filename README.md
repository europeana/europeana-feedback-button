# Europeana::FeedbackButton

[![Build Status](https://travis-ci.org/europeana/europeana-feedback-button.svg?branch=develop)](https://travis-ci.org/europeana/europeana-feedback-button) [![Security](https://hakiri.io/github/europeana/europeana-feedback-button/develop.svg)](https://hakiri.io/github/europeana/europeana-feedback-button/develop) [![Maintainability](https://api.codeclimate.com/v1/badges/326e7cf35738e64c36d6/maintainability)](https://codeclimate.com/github/europeana/europeana-feedback-button/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/326e7cf35738e64c36d6/test_coverage)](https://codeclimate.com/github/europeana/europeana-feedback-button/test_coverage)

Rails engine providing feedback functionality for various Europeana websites.

## Usage

### Include gem

* ``gem 'europeana-feedback-button', require: 'europeana/feedback_button'``
* Run ``bundle install``

### Generate an initializer

* Run ``bundle exec rails g europeana:feedback_button:install``
* Edit config/initializers/europeana_feedback_button.rb to configure the engine

### Mount the engine

* In config/routes.rb add: ``mount Europeana::FeedbackButton::Engine, at: '/'``

### Add FeedbackableView to your views

* Add ``include Europeana::FeedbackButton::FeedbackableView`` to any view you want to have a feedback button. Add it to app/views/application_view.rb for feedback buttons on all pages.

## License

Licensed under the EUPL V.1.1.

For full details, see [LICENSE.md](LICENSE.md).
