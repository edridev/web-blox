json.extract! book, :id, :room_id, :user_id, :data, :hora, :created_at, :updated_at
json.url book_url(book, format: :json)
