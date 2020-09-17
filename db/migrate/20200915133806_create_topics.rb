class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :image_id
      t.text :text
      t.timestamps
    end
  end
end
