class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = current_user.books
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = current_user.books.new(book_date: Date.tomorrow)
    @schedules = []
  end

  # GET /books/1/edit
  def edit
    @schedules = no_bookeds(@book.room_id,@book.book_date,@book.schedule)
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.user = current_user

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def no_bookeds(room, date, hour)
    list = hours
    list = list - [hour] unless hour=='undefined'
    bkds = Book.select(:schedule).where('book_date = ? and room_id = ?', 
      date,
      room
    ).map { |i| i.schedule }
    list - bkds
  end

  def unreserveds
    resp = no_bookeds(
      params[:room].to_i,
      Date.parse( params[:date] ),
      params[:hour]
    )
    render json: resp 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = current_user.books.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:room_id, :user_id, :book_date, :schedule)
    end
end
