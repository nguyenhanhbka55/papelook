require 'test_helper'

class ShopMembersControllerTest < ActionController::TestCase
  setup do
    @shop_member = shop_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_member" do
    assert_difference('ShopMember.count') do
      post :create, shop_member: { password_hash: @shop_member.password_hash, password_salt: @shop_member.password_salt, staff_email: @shop_member.staff_email, staff_name: @shop_member.staff_name, staff_type: @shop_member.staff_type }
    end

    assert_redirected_to shop_member_path(assigns(:shop_member))
  end

  test "should show shop_member" do
    get :show, id: @shop_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_member
    assert_response :success
  end

  test "should update shop_member" do
    patch :update, id: @shop_member, shop_member: { password_hash: @shop_member.password_hash, password_salt: @shop_member.password_salt, staff_email: @shop_member.staff_email, staff_name: @shop_member.staff_name, staff_type: @shop_member.staff_type }
    assert_redirected_to shop_member_path(assigns(:shop_member))
  end

  test "should destroy shop_member" do
    assert_difference('ShopMember.count', -1) do
      delete :destroy, id: @shop_member
    end

    assert_redirected_to shop_members_path
  end
end
