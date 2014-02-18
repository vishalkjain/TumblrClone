class Post < ActiveRecord::Base
   attr_accessible :title, :body, :photo_url, :link_url, :user_id

   validates :title, presence: true
   validate :must_have_one_post_type

   belongs_to :user
   has_many :taggings, class_name: "Tagging", foreign_key: :post_id
   has_many :tags, through: :taggings, source: :tag

   def must_have_one_post_type
     if body.blank? && photo_url.blank? && link_url.blank?
       errors.add(:body, "cannot be blank")
     end
   end
end
