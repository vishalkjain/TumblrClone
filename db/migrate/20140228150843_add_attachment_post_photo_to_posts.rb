class AddAttachmentPostPhotoToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :post_photo
    end
  end

  def self.down
    drop_attached_file :posts, :post_photo
  end
end
