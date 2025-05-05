require "test_helper"

class BarbershopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get barbershops_index_url
    assert_response :success
  end

  test "should get show" do
    get barbershops_show_url
    assert_response :success
  end
end
