require 'test_helper'

class AddressMetaControllerTest < ActionDispatch::IntegrationTest
  test "GET index" do
    get '/address-meta?address=60%20SW%2013th%20Street'

    assert_response :success
  end
end
