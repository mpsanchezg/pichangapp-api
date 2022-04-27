class CreatePichangas < ActiveRecord::Migration[6.1]
  def change
    create_table :pichangas do |t|
      t.references :home_team, null: false, foreign_key: { to_table: :users }
      t.references :visitor_team, optional: true, foreign_key: { to_table: :users }
      t.references :location, null: false, foreign_key: true
      t.text :instructions
      t.datetime :game_date
      t.string :results

      t.timestamps
    end
  end
end
