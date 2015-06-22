class RemoveSizesFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :sizes, :string
  end
end
