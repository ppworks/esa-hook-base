require 'json'
require 'rack/esa_webhooks'
require 'sinatra/base'

class App < Sinatra::Base
  use Rack::EsaWebhooks, secret: ENV.fetch('SECRET_TOKEN', '')

  post '/' do
    [204]
  end
end
