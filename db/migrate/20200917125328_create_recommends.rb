class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|
      t.integer :topic_id
      t.integer :user_id
      t.string :image_id
      t.text :comment
      t.timestamps
    end
  end
end
