class Follow < ActiveRecord::Base
   attr_accessible :user_id, :follow_id

   belongs_to :following_user, class_name: "User", foreign_key: :user_id
   #(aka current user)

   belongs_to :followed_user, class_name: "User", foreign_key: :follow_id
end
