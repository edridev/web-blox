# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  setup do
    @room = rooms(:sala1)
  end

  teardown do
    Rails.cache.clear
  end

  test "has not valid attributes" do
    assert @room.valid?
  end

  test "should not save room without name" do
    @room.name = nil
    assert_not @room.save
  end

  test "should not save room with duplicity in then name" do
    room2 = rooms(:sala2)
    room2.name = @room.name
    assert_not room2.save
  end

  test 'does not have has_many with books' do
    book = books(:_09h)
    @room.books << book
    @room.reload
    assert_not_empty @room.books
  end

end
