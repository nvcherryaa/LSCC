class AddAvatarToAlbums < ActiveRecord::Migration
  def change
    add_attachment :albums, :avatar
  end
end
