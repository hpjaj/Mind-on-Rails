require 'rails_helper'

RSpec.describe Note, :type => :model do
  
  describe "associations" do

    it "belongs to user" do
      expect(Note.new).to belong_to(:user)
    end

    it "has many and belongs to stacks" do
      expect(Note.new).to have_and_belong_to_many(:stacks)
    end

  end

  

end
