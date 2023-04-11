class SongQueueController < ApplicationController
  before_action :set_song_queue;
  def index
    @current_pointer = @song_queue.current_pointter
  end

  def update
    @song_queue.songs << Song.find_by_id(params[:id]);
  end

  def destroy
    @song_queue.songs.find_by_id(params[:id]).destroy!
  end

  def change_song
    current_user.song_queue.current_pointter =  params[:song_pointer].to_i % (current_user.song_queue.songs.count)
    current_user.song_queue.save!
    current_user.history.songs.destroy(current_song)
    current_user.history.songs << current_song
    current_user.history.save!
  end

  private
  def set_song_queue
      @song_queue = current_user.song_queue
  end

  def song_queue_params 
    params.permit(:id)
  end
end
