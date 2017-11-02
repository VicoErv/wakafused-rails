require 'test_helper'

class PoolControllerTest < ActionDispatch::IntegrationTest
  test "should get heartbeat" do
    get pool_heartbeat_url
    assert_response :success
  end

end
