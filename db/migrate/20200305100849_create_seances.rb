class CreateSeances < ActiveRecord::Migration[6.0]
  def change
    create_table :seances do |t|
      t.string :horaire
      t.references :cinema, null: false, foreign_key: true
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
