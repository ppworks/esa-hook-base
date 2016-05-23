require File.expand_path '../../test_helper.rb', __FILE__

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def signature(body)
    'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['SECRET_TOKEN'], body)
  end

  def test_get
    get '/', {}, { 'HTTP_X_ESA_SIGNATURE' => signature('') }
    assert_equal 404, last_response.status
    assert_match 'Not Found', last_response.body
  end

  def test_post
    post '/', {}, { 'HTTP_X_ESA_SIGNATURE' => signature('') }
    assert_equal 204, last_response.status
    assert_equal '', last_response.body
  end
end
