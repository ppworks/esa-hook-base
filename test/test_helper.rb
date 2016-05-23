ENV['RACK_ENV'] = 'test'
ENV['SECRET_TOKEN'] = 'secret'
ENV['ESA_API_TOKEN'] = 'esa_api_token'
require 'minitest/autorun'
require 'rack/test'
require 'mocha/mini_test'

require File.expand_path '../../app.rb', __FILE__
