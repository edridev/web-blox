json.extract! book, :id, :room_id, :user_id, :book_date, :schedule, :created_at, :updated_at
json.url book_url(book, format: :json)
