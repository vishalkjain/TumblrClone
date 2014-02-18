class Tagging < ActiveRecord::Base
   attr_accessible :tag_id, :post_id

   #validates :tag_id, :post_id, presence: true

   belongs_to :tag, class_name: "Tag", foreign_key: :tag_id, inverse_of: :tagging
   belongs_to :post, class_name: "Post", foreign_key: :post_id, inverse_of: :tagging

end
