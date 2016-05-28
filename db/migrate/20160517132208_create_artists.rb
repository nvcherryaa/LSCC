class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|

      t.timestamps null: false

      t.string :name,         null: false, default: ""

    end
  end
end
