require "test_helper"

class CalculationControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calculation_input_url
    assert_response :success
  end

  test 'check xml format' do
    get calculation_input_url, params: { query: '23', format: :xml }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'xml'
  end
end
