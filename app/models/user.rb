class User < ActiveRecord::Base
   has_many :songs, counter_cache: true
   has_many :playlists, dependent: :destroy
   has_many :songs_added, through: :playlists, source: :song
   has_secure_password

   email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

   validates :first_name, :presence => true
   validates :last_name, :presence => true
   validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
   validates :password, :length => { minimum: 8 }, :presence => true
   validates_presence_of :password, on: :new
   validates_confirmation_of :password, :allow_blank => false
end
