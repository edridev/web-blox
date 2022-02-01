# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  book_date  :date
#  schedule   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_books_on_room_id  (room_id)
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  room_id  (room_id => rooms.id)
#  user_id  (user_id => users.id)
#
require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # validates_presence_of :book_date, :schedule
  # validates_uniqueness_of :schedule, scope: [:book_date, :room_id]
  setup do
    @book = books(:_09h)
  end

  teardown do
    Rails.cache.clear
  end

  test "has not valid attributes" do
    assert @book.valid?
  end

  test "should not save book without book_date" do
    @book.book_date= nil
    assert_not @book.save
  end

  test "should not save book without schedule" do
    @book.schedule= nil
    assert_not @book.save
  end

  test "should be to exist the book_date_fmt attribute " do
    is_ok = (@book.respond_to?(:book_date_fmt) && @book.book_date_fmt==@book.book_date.strftime("%d/%m/%Y"))
    assert is_ok
  end

  test "should be to exist the dateTime attribute " do
    is_ok = (@book.respond_to?(:dateTime) && @book.dateTime==@book.book_date+ActiveSupport::Duration.hours(@book.schedule.to_i))
    assert is_ok
  end

  test "should not save book with duplicity in then schedule" do
    book2 = books(:_10h)
    book2.schedule = @book.schedule
    book2.book_date = @book.book_date
    book2.room = @book.room
    assert_not book2.save
  end

end
