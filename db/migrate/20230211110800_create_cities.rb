# frozen_string_literal: true

# migrate: table cities
class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :description
      t.string :state
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
