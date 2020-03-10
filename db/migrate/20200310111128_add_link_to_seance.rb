class AddLinkToSeance < ActiveRecord::Migration[6.0]
  def change
    add_column :seances, :link, :string
  end
end
