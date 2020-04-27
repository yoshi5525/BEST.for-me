class CreateContentTags < ActiveRecord::Migration[5.2]
  def change
    create_table :content_tags do |t|
      t.integer :content_id, foreign_key: true
      t.integer :tag_id, foreign_key: true
      t.timestamps
    end
  end
end
