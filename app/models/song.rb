class Song < ActiveRecord::Base
  belongs_to :user
  has_many :playlists, dependent: :destroy
  has_many :songs_added, through: :playlists, source: :user

  validates :title, :length => { minimum: 2}, :presence => true
  validates :artist, :length => { minimum: 2}, :presence => true

  def self.top
     order('artist DESC')
  end
end
