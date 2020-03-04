class AddNomToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nom, :string
  end
end
