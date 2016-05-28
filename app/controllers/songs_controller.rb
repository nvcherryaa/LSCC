class SongsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_song, only: [:edit, :show, :destroy, :update]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.album_id = session[:current_album_id]
    if @song.save
      flash[:notice] = "Song #{@song.title} successfully created"
      redirect_to album_path(session[:current_album_id])
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      flash[:notice] = 'Song successfully edited'
      redirect_to album_path(session[:current_album_id])
    else
      render :edit
    end

  end

  def destroy
    @song.destroy
    redirect_to album_path(session[:current_album_id])
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :album_id, :key, :lyrics, :chords, :bpm, :time_signature, :youtube_link)
  end
end
