require 'spec_helper'

describe Tag do
  describe "associations" do
    it { should have_many(:taggings) }
    it { should have_many(:tagged_posts) }
  end

end
