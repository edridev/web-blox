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
require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
