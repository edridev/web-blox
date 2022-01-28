class CalendarController < ApplicationController
  def index
    @rooms = Room.order(:name).all
    @book = Book.new
  end

  def events
    if params[:id]=='undefined'
      render json: []
    else
      events_param = params.permit( :start, :end )
      puts "events_params: #{events_param}"
      events_list = []
      books = Book.includes(:user).where('book_date > ? and book_date < ? ', events_param[:start], events_param[:end])
      books.each do |book|
        puts book.user.to_json
        events_list << {
          id: book.id,
          title: book.user.full_name,
          start: book.start_date,
          end: book.start_date
        } 
      end
      puts events_list
      render json: events_list
    end
  end
end
