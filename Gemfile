# frozen_string_literal: true
source 'https://rubygems.org'

# Specify your gem's dependencies in europeana-blacklight.gemspec
gemspec

group :test do
  gem 'coveralls', require: false
end

group :test, :develop do
  gem 'sqlite3'
  gem 'rubocop', '0.48.1', require: false # only update when Hound does
end
