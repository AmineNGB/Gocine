class AddPrenomToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :prenom, :string
  end
end
