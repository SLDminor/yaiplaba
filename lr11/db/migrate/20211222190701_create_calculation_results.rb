class CreateCalculationResults < ActiveRecord::Migration[6.1]
  def change
    create_table :calculation_results do |t|
      t.string :query, null: false
      t.string :result
      t.boolean :error, default: false

      t.timestamps
    end
    add_index :calculation_results, :query, unique: true
  end
end
