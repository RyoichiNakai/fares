class CreateRecommenders < ActiveRecord::Migration[5.2]
  def change
    create_table :recommenders do |t|
      t.integer :user_id
      t.string :real_name
      t.string :phone_number
      t.string :address
      t.timestamps
    end
  end
end
