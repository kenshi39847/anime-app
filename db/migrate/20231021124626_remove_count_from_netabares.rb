class RemoveCountFromNetabares < ActiveRecord::Migration[7.0]
  def change
    remove_column :netabares, :count, :integer
  end
end
