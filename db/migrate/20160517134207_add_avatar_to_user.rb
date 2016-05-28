class AddAvatarToUser < ActiveRecord::Migration
  def change
    add_attachment :artists, :avatar
  end
end
