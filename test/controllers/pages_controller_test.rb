require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get contact" do
    get page_contact_url
    assert_response :success
  end

  test "should get about" do
    get page_about_url
    assert_response :success
  end

  test "should get term" do
    get page_term_url
    assert_response :success
  end

  test "should get support" do
    get page_support_url
    assert_response :success
  end

  test "should get privacy" do
    get page_privacy_url
    assert_response :success
  end

end
