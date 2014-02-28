class DashboardsController < ApplicationController
  include ActiveRecord::SpawnMethods
  before_filter :require_signed_in!
  def show
    @myposts = current_user.posts.order(&:created_at).reverse_order
    @otherPosts = current_user.followed_posts.order(&:created_at).reverse_order
    @posts = @myposts + @otherPosts

    @users = []
    @users.push(current_user)
    @users.concat(current_user.followed_users)
    #[].push(current_user).concat(current_user.followed_users)

    @posts = Post.where("user_id IN (?)", @users).order("created_at DESC")

   # @posts = Post.where("user_id IN (?)", @users).includes(:user).order("created_at DESC")

    #continue work here
    #Post.joins("INNER JOIN users AS u1 ON posts.user_id = u1.id").joins("INNER JOIN follows ON follows.follow_id = u1.id").joins("INNER JOIN users AS u2 ON follows.user_id = u2.id")

    # Post.joins("LEFT OUTER JOIN users AS u1 ON posts.user_id = u1.id").where("posts.user_id = 6").joins("INNER JOIN follows ON follows.user_id = u1.id").joins("LEFT OUTER JOIN users AS u2 ON follows.follow_id = u2.id")
      #
    # SELECT posts.*
    # FROM posts
    # WHERE (posts.user_id = current_user.id) OR (posts.user_id IN
    #   (SELECT users.id)
    #   FROM users
    #   WHERE
    #   )
    #
  end
end
