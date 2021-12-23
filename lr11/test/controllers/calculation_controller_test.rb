require "test_helper"

class CalculationControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calculation_input_url
    assert_response :success
  end

  test "should get view" do
    get calculation_view_url
    assert_response :success
  end
end
