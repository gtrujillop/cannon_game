require 'rails_helper'

describe Subject do

  describe "presence validations" do

    it { should validate_presence_of(:name) }

  end

  describe "relations" do
    it { should have_many(:sessions) }
  end
end

