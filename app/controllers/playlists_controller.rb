class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :set_videos, only: [:show]

  def index
    @playlists = current_user.playlists
  end

  def show
  end

  def new
    @playlist = Playlist.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
      if @playlist.save
        flash[:success] = 'Playlist Created'
        redirect_to user_playlists_path
      else
        flash[:error] = "Error: #{@playlist.errors.full_messages.join("\n")}"
        render :form
      end
  end

  def update
    if @playlist.update(playlist_params)
      flash[:success] = 'Playlist Updated'
      redirect_to playlists_path
    else
      flash[:error] = "Error: #{@playlist.errors.full_messages.join("\n")}"
      render :form
    end
  end

  def destroy
    @playlist.destroy
    flash[:success] = 'Playlist Destroyed'
    redirect_to playlists_path
  end

  private
    def set_videos
      @videos = Video.all
    end

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title, :user_id)
    end

end
