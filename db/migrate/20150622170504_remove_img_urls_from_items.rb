class RemoveImgUrlsFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :imgUrls, :string
  end
end
