class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :state
      t.integer :median_income
      t.float :unemployment
      t.float :metro_population
      t.float :adults_with_hs

      t.timestamps
    end
  end
end
