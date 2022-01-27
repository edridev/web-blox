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
class Book < ApplicationRecord
  belongs_to :room
  belongs_to :user

  accepts_nested_attributes_for :room

  validates_presence_of :book_date, :schedule, :schedule
  validates_uniqueness_of :schedule, scope: :book_date

  def book_date_fmt
    self.book_date.strftime("%d/%m/%Y")
  end

end
