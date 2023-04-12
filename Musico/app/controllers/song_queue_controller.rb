class SongQueueController < ApplicationController
  before_action :set_song_queue;
  def index
    @current_pointer = @song_queue.current_pointter
  end

  def update
    @song_queue.songs << Song.find_by_id(params[:id]);
  end

  def destroy
    @song_queue.songs.destroy(Song.find_by_id(params[:id]))
    render :index
  end

  def change_song
    current_user.song_queue.current_pointter =  params[:song_pointer].to_i % (current_user.song_queue.songs.count)
    current_user.song_queue.save!
    current_user.history.songs.destroy(current_song)
    current_user.history.songs << current_song
    current_user.history.save!
  end

  def play_playlist
    current_user.song_queue.current_pointter = 0
    current_user.song_queue.songs.clear
    current_user.song_queue.songs << Playlist.find(params[:playlist_id]).songs
    current_user.song_queue.save!
    redirect_to request.referrer
  end

  def play_song
    current_user.song_queue.current_pointter = 0
    current_user.song_queue.songs.clear
    current_user.song_queue.songs << Song.find(params[:song_id])
    current_user.song_queue.save!
    redirect_to request.referrer
  end

  private
  def set_song_queue
      @song_queue = current_user.song_queue
  end

  def song_queue_params 
    params.permit(:id)
  end
end
