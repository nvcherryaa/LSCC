class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|

      t.string :title, null: false
      t.integer :album_id
      t.string :key
      t.text :lyrics
      t.text :chords
      t.integer :bpm
      t.string :time_signature

      t.timestamps null: false

    end
  end
end
