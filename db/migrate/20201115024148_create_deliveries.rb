class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :postal_code,          null: false
      t.integer    :prefecture_genre_id,  null: false 
      t.string     :municipality,         null: false 
      t.string     :address,              null: false 
      t.string     :build_name
      t.string     :phone_number,         null: false
      t.references :order,                null: false
      t.timestamps
    end
  end
end
