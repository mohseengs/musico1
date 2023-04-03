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
     @song_queue.current_pointter = params[:song_pointer]
     @current_pointer = @song_queue.current_pointer
     puts " ================ " 
  end

  private
  def set_song_queue
    if current_user.song_queue
      @song_queue = current_user.song_queue
    else
      @song_queue = SongQueue.new
      @song_queue.user = current_user
      @song_queue.current_pointter = 0
    end
  end

  def song_queue_params 
    params.permit(:id)
  end
end
