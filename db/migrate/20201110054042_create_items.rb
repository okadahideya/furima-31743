class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                     foreign_key: true
      t.string     :name,                     null: false
      t.text       :explanation,              null: false
      t.integer    :category_genre_id,        null: false
      t.integer    :status_genre_id,          null: false
      t.integer    :delivery_burden_genre_id, null: false
      t.integer    :prefecture_genre_id,      null: false
      t.integer    :delivery_days_genre_id,   null: false
      t.integer    :price,                    null: false
      t.timestamps
    end
  end
end
