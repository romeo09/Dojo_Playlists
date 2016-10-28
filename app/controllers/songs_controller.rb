class SongsController < ApplicationController
  def index
     @songs = Song.all
     @user = User.find(params[:id])
     @song_added = Song.top
  end

  def new
  end

  def show
   #   @user = User.find(params[:id])
     @users = User.where(session[:user_id]).all
     @song = Song.find(params[:id])
     @added_songs = @song.songs_added
  end

  def create
    @user = current_user
     song = Song.new(title: song_params[:title], artist: song_params[:artist], user_id: @user)
         flash["success"] = "Your Song Has Been Added!"
      if song.save
          redirect_to :back
      else
          flash[:errors] = song.errors.full_messages
          redirect_to :back
      end
  end

   private
   def song_params
     params.require(:song).permit(:title, :artist)
  end
end
