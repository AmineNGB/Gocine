class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :photo_url
      t.string :title
      t.text :synopsis
      t.string :duration
      t.string :date_release
      t.string :genre
      t.float :rate_press
      t.float :rate_viewer

      t.timestamps
    end
  end
end
