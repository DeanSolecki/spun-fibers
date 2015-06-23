class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :family, null: false
      t.string :style, null: false
      t.string :title, null: false
      t.string :store, null: false
      t.string :brand, null: false
      t.string :url, null: false

      t.timestamps null: false
    end

		add_index :items, :url, unique: true
  end
end
