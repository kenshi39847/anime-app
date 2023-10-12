class CreateAnimes < ActiveRecord::Migration[7.0]
  def change
    create_table :animes do |t|
      t.string :title,              null: false
      t.text :synopsis,             null: false
      t.integer :genre_id,          null: false
      t.integer :good_point_id,     null: false
      t.integer :recommendation_id, null: false
      t.references :user,           null: false
      t.text :text,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
