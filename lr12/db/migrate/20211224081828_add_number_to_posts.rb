class AddNumberToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :number, :string
    add_column :posts, :integer, :string
  end
end
