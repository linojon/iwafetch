require File.dirname(__FILE__) + '/../test_helper'
require 'searches_controller'

# Re-raise errors caught by the controller.
class SearchesController; def rescue_action(e) raise e end; end

class SearchesControllerTest < Test::Unit::TestCase
  fixtures :searches

  def setup
    @controller = SearchesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:searches)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_search
    assert_difference('Search.count') do
      post :create, :search => { }
    end

    assert_redirected_to search_path(assigns(:search))
  end

  def test_should_show_search
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_search
    put :update, :id => 1, :search => { }
    assert_redirected_to search_path(assigns(:search))
  end

  def test_should_destroy_search
    assert_difference('Search.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to searches_path
  end
end
