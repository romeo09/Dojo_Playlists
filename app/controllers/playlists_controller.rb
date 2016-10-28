class PlaylistsController < ApplicationController
  def create
     song = Song.find(params[:song_id])
     add = Playlist.create(user: current_user, song: song)
     @like_song = song.times_added
     @like_song = @like_song +1
     song.update(times_added: @like_song)
     redirect_to ("/songs/index/#{current_user.id}")
  end

end
