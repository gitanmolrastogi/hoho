require 'test_helper'

class User::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_activities_index_url
    assert_response :success
  end

end
