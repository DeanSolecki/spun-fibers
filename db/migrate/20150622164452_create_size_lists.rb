class CreateSizeLists < ActiveRecord::Migration
  def change
    create_table :size_lists do |t|

      t.timestamps null: false
    end
  end
end
