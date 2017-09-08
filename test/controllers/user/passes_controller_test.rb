require 'test_helper'

class User::PassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_passes_index_url
    assert_response :success
  end

end
