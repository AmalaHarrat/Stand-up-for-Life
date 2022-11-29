require "test_helper"

class Organismes::MissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organismes_missions_index_url
    assert_response :success
  end

  test "should get show" do
    get organismes_missions_show_url
    assert_response :success
  end

  test "should get new" do
    get organismes_missions_new_url
    assert_response :success
  end
end
