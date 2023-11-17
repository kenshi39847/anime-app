class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :favorite1
      t.string :favorite2
      t.string :favorite3
      t.string :favorite4
      t.string :favorite5
      t.text :free_comment
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
