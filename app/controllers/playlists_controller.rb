class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    @playlists = current_user.accounts
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
    @playlist = current_user.playlist.new(playlist_params)
      if @playlist.save
        flash[:success] = 'Playlist Created'
        redirect_to @playlist
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
    redirect_to playlists_path
  end

  private

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title)
    end

end
