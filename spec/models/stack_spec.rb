require 'rails_helper'

RSpec.describe Stack, :type => :model do

  describe "associations" do

    it "has many and belongs to notes" do
      expect(Stack.new).to have_and_belong_to_many(:notes)
    end

  end
  
end
