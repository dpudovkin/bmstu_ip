require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest

    test 'check rss' do
      get '/', params: { number: 1000,  format: :rss }
      assert_response :success
      assert_includes @response.headers['Content-Type'], 'application/rss'
    end

end
