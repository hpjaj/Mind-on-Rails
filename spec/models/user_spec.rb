require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "associations" do

    it "has many notes" do
      expect(User.new).to have_many(:notes).dependent(:destroy)
    end 

  end

end
