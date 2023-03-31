class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def song
    puts "like sdfksdfkdsjf sssssssssssssssssssssssssssssssssssssssssssssssssssss"
    like = Like.new
    like.user = current_user
    like.likeable = Song.find(params[:song_id])
    like.save!
    render :index
  end

  def playlist
    puts "like sdfksdfkdsjf pppppppppppppppppppppppppppppppppppppppppppppppppppppp"
    like = Like.new
    like.user = current_user
    like.likeable = Playlist.find(params[:id])
    like.save!
    #render :index
  end
end
