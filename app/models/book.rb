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
class Book < ApplicationRecord
  belongs_to :room
  belongs_to :user

  accepts_nested_attributes_for :room, :user

  validates_presence_of :book_date, :schedule
  validates_uniqueness_of :schedule, scope: [:book_date, :room_id]

  def book_date_fmt
    self.book_date.strftime("%d/%m/%Y")
  end

  def dateTime
    self.book_date + ActiveSupport::Duration.hours(self.schedule.to_i)
  end

end
