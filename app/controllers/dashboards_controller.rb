class DashboardsController < ApplicationController
  include ActiveRecord::SpawnMethods
  def show
    @myposts = current_user.posts.order(&:created_at).reverse_order
    @otherPosts = current_user.followed_posts.order(&:created_at).reverse_order
    #@posts = @myposts + @otherPosts


    @users = [].push(current_user).concat(current_user.following_users)

    @posts = Post.where("user_id IN (?)", @users).includes(:user).order("created_at DESC")


    #continue work here
    #Post.joins("INNER JOIN users AS u1 ON posts.user_id = u1.id").joins("INNER JOIN follows ON follows.follow_id = u1.id").joins("INNER JOIN users AS u2 ON follows.user_id = u2.id")

    # Post.joins("LEFT OUTER JOIN users AS u1 ON posts.user_id = u1.id").
#     joins("INNER JOIN follows ON follows.user_id = u1.id").
#     joins("LEFT OUTER JOIN users AS u2 ON follows.follow_id = u2.id")
  end
end
