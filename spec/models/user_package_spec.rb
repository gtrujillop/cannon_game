require 'rails_helper'

describe UserPackage do

  describe "relation with user" do
    it { should belong_to(:user) }
  end

  describe "relation with package" do
    it { should belong_to(:package) }
  end

end

