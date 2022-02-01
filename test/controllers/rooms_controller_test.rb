require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @room = rooms(:sala1)
    @attributes = {
      name: 'Sala 2134'
    }
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    sign_in users(:francisco)
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:francisco)
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    sign_in users(:francisco)
    assert_difference('Room.count') do
      post rooms_url, params: { room: @attributes }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show room" do
    sign_in users(:francisco)
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:francisco)
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    sign_in users(:francisco)
    patch room_url(@room), params: { room: { name: @room.name } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    sign_in users(:francisco)
    room2 = Room.create name: Faker::Name.name
    assert_difference('Room.count', -1) do
      delete room_url(room2)
    end

    assert_redirected_to rooms_url
  end
end
