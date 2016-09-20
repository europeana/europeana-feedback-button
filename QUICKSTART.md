# Quickstart

## Include gem

 * ``gem 'europeana-feedback-button'``
 * run ``bundle install``

## Require Europeana::FeedbackButton

 * add ```require 'europeana/feedback_button'`` to your apps  config/application.rb
  
## Mount the engine

* in config/routes.rb add: ```mount Europeana::FeedbackButton::Engine, at: "/"``

## Add FeedbackableView to your views

 * add ```include Europeana::FeedbackButton::FeedbackableView``` to any view you want to have a feedback button. Add it to app/views/application_view.rb for feedback buttons on all pages.

## Set FEEDBACK_MAIL_TO

* the engine only shows feedback buttons if you have a mail address configured in your .env file.
 * ```FEEDBACK_MAIL_TO=example@example.org```


## optional

 * Include ``helper Europeana::FeedbackButton::FeedbackHelper`` in your application_controller.rb
 * this will allow you to acces the helper methods from the engine without haveing to explicitly reference them with ```Europeana::FeedbackButton``` 

