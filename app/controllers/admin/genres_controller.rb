class Admin::GenresController < ApplicationController
  layout "admin"

  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_filter :require_login

  # GET /genres
  def index
    @genres = Genre.all
  end

  # GET /genres/1
  def show
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to [:admin, @genre], notice: 'Genre was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      redirect_to [:admin, @genre], notice: 'Genre was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /genres/1
  def destroy
    @genre.destroy
    redirect_to admin_genres_url, notice: 'Genre was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def genre_params
      params.require(:genre).permit(:name, :css_class)
    end
end
