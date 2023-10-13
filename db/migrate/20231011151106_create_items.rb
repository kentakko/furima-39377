class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :email,              null: false
      t.text :explanation,           null: false
      t.integer :category_id,           null: false
      t.integer :status_id,             null: false
      t.integer :shipping_price_id,     null: false
      t.integer :prefecture_id,         null: false
      t.integer :shipping_date_id,      null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
