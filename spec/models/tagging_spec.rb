require 'spec_helper'

describe Tagging do
  describe "associations" do
    it { should belong_to(:tag) }
    it { should belong_to(:post) }
  end
end
