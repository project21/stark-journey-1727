require 'test_helper'

class DealControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get all_cities" do
    get :all_cities
    assert_response :success
  end

  test "should get new_deals" do
    get :new_deals
    assert_response :success
  end

  test "should get retailers" do
    get :retailers
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get questions" do
    get :questions
    assert_response :success
  end

end
