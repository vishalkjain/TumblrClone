class Renametagname < ActiveRecord::Migration
  def up
    rename_column :tags, :name, :tag_name
  end

  def down
  end
end
