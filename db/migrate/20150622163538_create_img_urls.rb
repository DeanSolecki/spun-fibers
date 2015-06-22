class CreateImgUrls < ActiveRecord::Migration
  def change
    create_table :img_urls do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
