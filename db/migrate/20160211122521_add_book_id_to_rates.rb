class AddBookIdToRates < ActiveRecord::Migration
  def change
    add_column :rates, :book_id, :integer
  end
end
