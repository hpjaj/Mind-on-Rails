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

  describe "validations" do

    before do
      user = FactoryGirl.create(:user)
      stack = FactoryGirl.create(:stack)
    end

    it "ensures title is at least 5 characters" do
      note = FactoryGirl.build(:note, :title => "123" )
      expect(note).to ensure_length_of(:title).is_at_least(5).with_message(/Minimum length of 5 characters/)
    end

    it "ensures body is at least 15 characters" do
      note = FactoryGirl.build(:note, :body => "12345678901234" )
      expect(note).to ensure_length_of(:body).is_at_least(15).with_message(/Minimum length of 15 characters/)
    end

    it "ensures presence of at least one stack" do
      note = FactoryGirl.build(:note, :stacks => [])
      expect(note.errors).to include("Choose at least 1 stack")
      # expect(note).to validate_presence_of(:stack_ids).with_message(/Choose at least 1 stack/)
    end
  end

  

end
