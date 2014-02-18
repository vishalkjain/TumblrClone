class RemovePostidfromTags < ActiveRecord::Migration
  def up
    remove_column :tags, :post_id
  end

  def down
  end
end
