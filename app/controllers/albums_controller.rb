class AlbumsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_album, only: [:edit, :show, :destroy, :update]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.artist_id = session[:current_artist_id]
    if @album.save
      flash[:notice] = "Album #{@album.name} successfully created"
      redirect_to artist_path(session[:current_artist_id])
    else
      render :new
    end
  end

  def show
    session[:current_album_id] = params[:id]
  end

  def edit
  end

  def update

    @album = Album.find(params[:id]);
    if @album.update(album_params)
      flash[:notice] = 'Album successfully edited'
      redirect_to artist_path(session[:current_artist_id])
    else
      render :edit
    end

  end

  def destroy
    @album.destroy
    redirect_to artist_path(session[:current_artist_id])
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :avatar, :artist_id)
  end
end