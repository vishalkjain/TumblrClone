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
end
