require 'test_helper'

class HorsesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get horses_index_url
    assert_response :success
  end

  test "should get create" do
    get horses_create_url
    assert_response :success
  end

  test "should get new" do
    get horses_new_url
    assert_response :success
  end

  test "should get destroy" do
    get horses_destroy_url
    assert_response :success
  end

  test "should get show" do
    get horses_show_url
    assert_response :success
  end

end
