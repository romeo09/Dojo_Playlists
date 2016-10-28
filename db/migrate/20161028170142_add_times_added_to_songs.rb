class AddTimesAddedToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :times_added, :integer, defult: 0
  end
end
