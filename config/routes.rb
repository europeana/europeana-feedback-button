Europeana::FeedbackButton::Engine.routes.draw do
  post 'feedback', to: 'feedback#create'
end
