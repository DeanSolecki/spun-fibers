class CreateImgUrlLists < ActiveRecord::Migration
  def change
    create_table :img_url_lists do |t|

      t.timestamps null: false
    end
  end
end
