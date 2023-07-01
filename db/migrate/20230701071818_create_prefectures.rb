class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|

      t.string :name, null: false

      t.timestamps
    end

    create_table :prefectures do |t|

      t.references :region, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
    change_table :posts do |t|
      t.remove :prefectures
      t.references :prefecture, null: false, foreign_key: true
    end
  end
end
