require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:francisco)
    @book = books(:_09h)
    @attributes = {
      book_date: Date.tomorrow,
      room_id: rooms(:sala1).id,
      user_id: @user.id,
      schedule: '16h'
    }
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    sign_in @user
    get books_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    sign_in @user
    assert_difference('Book.count') do
      post books_url, params: { book: @attributes }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    sign_in @user
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    sign_in @user
    patch book_url(@book), params: { book: { book_date: @book.book_date, room_id: @book.room_id, schedule: @book.schedule, user_id: @book.user_id } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    sign_in @user
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
