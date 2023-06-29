class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :prefectures, null: false
      t.string :spot_name, null: false
      t.string :spot_postal_code, null: false
      t.string :spot_address, null: false
      t.string :point, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
  end
end
