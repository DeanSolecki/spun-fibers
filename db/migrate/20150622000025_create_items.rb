class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :family
      t.string :style
      t.string :title
      t.string :store
      t.string :brand
      t.string :url

      t.timestamps null: false
    end
  end
end
