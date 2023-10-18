class CreateNetabares < ActiveRecord::Migration[7.0]
  def change
    create_table :netabares do |t|
      t.integer    :count, null: false, default: 0
      t.references :user,  null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
