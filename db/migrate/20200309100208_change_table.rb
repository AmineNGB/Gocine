class ChangeTable < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :cinema
    add_reference :events, :cinema, foreign_key: true
    remove_reference :events, :film
    add_reference :events, :seance, foreign_key: true
    remove_column :events, :schedule
    add_column :events, :schedule, :datetime

    remove_column :seances, :horaire
    add_column :seances, :horaire, :datetime

  end
end
