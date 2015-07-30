class Admin::SpicesController < ApplicationController
  before_action :set_spice, only: [:show, :edit, :update, :destroy]

  # GET /spices
  def index
    @spices = Spice.all
  end

  # GET /spices/1
  def show
  end

  # GET /spices/new
  def new
    @spice = Spice.new
  end

  # GET /spices/1/edit
  def edit
  end

  # POST /spices
  def create
    @spice = Spice.new(spice_params)

    if @spice.save
      redirect_to @spice, notice: 'Spice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spices/1
  def update
    if @spice.update(spice_params)
      redirect_to @spice, notice: 'Spice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spices/1
  def destroy
    @spice.destroy
    redirect_to spices_url, notice: 'Spice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spice
      @spice = Spice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spice_params
      params.require(:spice).permit(:name, :css_class)
    end
end
