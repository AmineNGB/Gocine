class ChangeTableFilm < ActiveRecord::Migration[6.0]
  def change

    remove_column :films, :date_release
    add_column :films, :date_release, :datetime

  end
end
