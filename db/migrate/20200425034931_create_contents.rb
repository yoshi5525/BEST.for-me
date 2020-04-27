class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :product, null: false
      t.text :body, null: false
      t.string :image, null: false
      t.string :link
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
