require 'spec_helper'

describe User do
  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:follows) }
    it { should have_many(:followers) }
    it { should have_many(:followed_users) }
    it { should have_many(:following_users) }
    it { should have_many(:followed_posts) }
  end

  context "without user attributes" do
    let(:bad_user){ user = User.new}

    it "validates presence of username" do
      expect(:bad_user).to have_at_least(1).error_on(:username)
    end

    it "validates presence of password" do
      expect(:bad_user).to have_at_least(1).error_on(:password)
    end

    it "validates presence of password_digest" do
      expect(:bad_user).to have_at_least(1).error_on(:password_digest)
    end

    it "validates presence of email" do
      expect(:bad_user).to have_at_least(1).error_on(:email)
    end

    it "validates presence of session_token" do
      expect(:bad_user).to have_at_least(1).error_on(:session_token)
    end
  end
end
