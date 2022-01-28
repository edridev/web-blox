class TetetetesController < ApplicationController
  before_action :set_tetetete, only: %i[ show edit update destroy ]

  # GET /tetetetes or /tetetetes.json
  def index
    @tetetetes = Tetetete.all
  end

  # GET /tetetetes/1 or /tetetetes/1.json
  def show
  end

  # GET /tetetetes/new
  def new
    @tetetete = Tetetete.new
  end

  # GET /tetetetes/1/edit
  def edit
  end

  # POST /tetetetes or /tetetetes.json
  def create
    @tetetete = Tetetete.new(tetetete_params)

    respond_to do |format|
      if @tetetete.save
        format.html { redirect_to tetetete_url(@tetetete), notice: "Tetetete was successfully created." }
        format.json { render :show, status: :created, location: @tetetete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tetetete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tetetetes/1 or /tetetetes/1.json
  def update
    respond_to do |format|
      if @tetetete.update(tetetete_params)
        format.html { redirect_to tetetete_url(@tetetete), notice: "Tetetete was successfully updated." }
        format.json { render :show, status: :ok, location: @tetetete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tetetete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tetetetes/1 or /tetetetes/1.json
  def destroy
    @tetetete.destroy

    respond_to do |format|
      format.html { redirect_to tetetetes_url, notice: "Tetetete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tetetete
      @tetetete = Tetetete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tetetete_params
      params.require(:tetetete).permit(:name, :full_name, :address, :number, :district, :city, :state, :country)
    end
end
