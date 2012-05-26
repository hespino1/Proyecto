require 'test_helper'

class InvitacionesControllerTest < ActionController::TestCase
  setup do
    @invitacione = invitaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invitaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invitacione" do
    assert_difference('Invitacione.count') do
      post :create, invitacione: @invitacione.attributes
    end

    assert_redirected_to invitacione_path(assigns(:invitacione))
  end

  test "should show invitacione" do
    get :show, id: @invitacione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invitacione
    assert_response :success
  end

  test "should update invitacione" do
    put :update, id: @invitacione, invitacione: @invitacione.attributes
    assert_redirected_to invitacione_path(assigns(:invitacione))
  end

  test "should destroy invitacione" do
    assert_difference('Invitacione.count', -1) do
      delete :destroy, id: @invitacione
    end

    assert_redirected_to invitaciones_path
  end
end
