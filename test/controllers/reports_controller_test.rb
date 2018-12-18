require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get Report" do
    get reports_Report_url
    assert_response :success
  end

end
