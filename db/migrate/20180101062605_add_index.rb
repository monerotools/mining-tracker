class AddIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :stats, :address
    add_index :stats, :amtPaid
    add_index :stats, :amtDue
    add_index :stats, :payment
    add_index :stats, :total
    add_index :stats, :created_at
    add_index :stats, :genesis
  end
end
