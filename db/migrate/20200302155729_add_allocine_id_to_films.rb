class AddAllocineIdToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :allocine_id, :string
  end
end
