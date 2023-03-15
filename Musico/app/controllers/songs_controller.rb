class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]

  # GET /songs or /songs.json
  def index
      @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
      @song = Song.new
      @categories = Category.all
      @languages = Language.all
      @users = User.all

  end

  # GET /songs/1/edit
  def edit
  end

  def create
      @song = Song.new(song_params)
    
      if @song.save
        @song.users << current_user
        @song.users << params[:users].map{ |id| User.find_by_id(id) }
        
        redirect_to song_url(@song), notice: "Song was successfully created."
      end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
      redirect_to song_url(@song), notice: "Song was successfully updated."
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
      @song.destroy!

      redirect_to songs_url, notice: "Song was successfully destroyed."
  end

  def search_user
      query = params[:query]
      @users = User.where("name LIKE ?", "%" + query + "%")
      puts @users

      render json: @users 
  end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_song
        @song = Song.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def song_params
        params.require(:song).permit(:name, :category_id, :language_id)
      end
end
