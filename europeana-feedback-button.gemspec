# frozen_string_literal: true

$:.push File.expand_path('../lib', __FILE__)

require 'europeana/feedback_button/version'

Gem::Specification.new do |s|
  s.name        = 'europeana-feedback-button'
  s.version     = Europeana::FeedbackButton::VERSION
  s.authors     = ['Lutz Biedinger', 'Richard Doe']
  s.email       = %w(lutz.biedinger@europeana.eu richard.doe@europeana.eu)
  s.homepage    = 'http://github.org/europeana/europeana-feedback-button'
  s.summary     = 'Europeana Feedback Button.'
  s.description = 'An engine which allows the Europeana Feedback Button to be displayed.'
  s.license = 'EUPL-1.1'

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w(lib)

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'rails', '>= 4.2.7.1', '< 6'

  s.add_development_dependency 'bundler', '~> 1.8'
  s.add_development_dependency 'rake', '~> 11.0'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'dotenv-rails', '~> 2.1'
  s.add_development_dependency 'shoulda-matchers', '~> 3'
end
