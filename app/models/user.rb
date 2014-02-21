class User < ActiveRecord::Base
  attr_accessible :username, :password, :email, :avatar
  attr_reader :password

  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  before_validation :ensure_session_token

  has_many :posts
  has_many :follows, class_name: "Follow", foreign_key: :user_id
  has_many :followers, class_name: "Follow", foreign_key: :follow_id
  has_many :followed_users, through: :follows, source: :followed_user
  has_many :following_users, through: :followers, source: :following_user
  has_many :followed_posts, through: :followed_users, source: :posts

  has_attached_file :avatar, :styles => {
          :small => "100x100#"
          }, :default_url => "https://s3.amazonaws.com/vishal-tumblr-clone-dev/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
