class CreatePlofiles < ActiveRecord::Migration[7.0]
  def change
    create_table :plofiles do |t|
      t.string :favorite1
      t.string :favirite2
      t.string :favirite3
      t.string :favirite4
      t.string :favirite5
      t.text :free_comment
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
