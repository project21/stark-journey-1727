require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get cities" do
    get :cities
    assert_response :success
  end

  test "should get retailers" do
    get :retailers
    assert_response :success
  end

  test "should get new_deals" do
    get :new_deals
    assert_response :success
  end

  test "should get q" do
    get :q
    assert_response :success
  end

end
