class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|

      t.timestamps null: false
      t.string :name,         null: false, default: ""
    end
  end
end
