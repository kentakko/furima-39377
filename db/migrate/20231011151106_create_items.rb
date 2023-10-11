class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :email,              null: false
      t.text :explanation,           null: false
      t.integer :category,           null: false
      t.integer :statue,             null: false
      t.integer :shipping_price,     null: false
      t.integer :prefecture,         null: false
      t.integer :shipping_date,      null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
