class CreateFinishes < ActiveRecord::Migration[7.0]
  def change
    create_table :finishes do |t|
      t.string :finish_anime, null: false
      t.integer :group_id,    null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
