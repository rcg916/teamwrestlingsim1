class AddRepToGames < ActiveRecord::Migration[5.2]
  def change
  	add_column :games, :coachrep, :integer, default: 70
  end
end
