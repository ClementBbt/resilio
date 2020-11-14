require 'test_helper'

class ResiliationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resiliations_index_url
    assert_response :success
  end

  test "should get show" do
    get resiliations_show_url
    assert_response :success
  end

end
