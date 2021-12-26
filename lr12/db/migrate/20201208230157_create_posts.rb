class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :number
      t.string :result
      t.timestamps
    end
  end
end
