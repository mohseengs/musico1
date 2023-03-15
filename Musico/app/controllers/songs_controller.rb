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
      if @song.save!
        redirect_to song_url(@song), notice: "Song was successfully created."
      else
        redirect_to new_song_path, notice: "Something went wrong"
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
      @users = User.search(query , current_user.id)
  end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_song
        @song = Song.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def song_params
        params.require(:song).permit(:name, :category_id, :language_id, :user_ids => [])
      end
end