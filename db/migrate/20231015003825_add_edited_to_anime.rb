class AddEditedToAnime < ActiveRecord::Migration[7.0]
  def change
    add_column :animes, :edited, :boolean
  end
end
