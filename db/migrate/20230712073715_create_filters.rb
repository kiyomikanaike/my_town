class CreateFilters < ActiveRecord::Migration[6.1]
  def change
    create_table :filters do |t|

      t.timestamps
    end
  end
end
