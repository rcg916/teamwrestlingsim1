class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :teamname
      t.string :coachname
      t.integer :weeknum, default: 1
      t.integer :monthnum, default: 1
      t.integer :yearnum, default: 1
      t.timestamps
    end
  end
end
