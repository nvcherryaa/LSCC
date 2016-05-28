class ArtistsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_artist, only: [:edit, :show, :destroy, :update]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = "Artist #{@artist.name} successfully created"
      redirect_to artists_path
    else
      render :new
    end
  end

  def show
    session[:current_artist_id] = @artist.id
  end

  def edit
  end

  def update

    @artist = Artist.find(params[:id]);
    if @artist.update(artist_params)
      flash[:notice] = 'Artist successfully edited'
      redirect_to artists_path
    else
      render :edit
    end

  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :avatar)
  end
end
