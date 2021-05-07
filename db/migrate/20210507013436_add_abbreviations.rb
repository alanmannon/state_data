class AddAbbreviations < ActiveRecord::Migration[6.0]
  def change
    add_column :states, :abbreviation, :string
    add_column :states, :code, :string
  end
end
