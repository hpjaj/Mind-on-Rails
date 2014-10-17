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

    it "ensures title is at least 5 characters" do
      expect(Note.new).to ensure_length_of(:title).is_at_least(5).with_message(/ - Minimum length of 5 characters/)
    end

    it "ensures body is at least 5 characters" do
      expect(Note.new).to ensure_length_of(:body).is_at_least(5).with_message(/ - Minimum length of 5 characters/)
    end

    it "ensures presence of at least one stack" do
      note = Note.new

      # Trigger validation by calling model.valid?
      expect(note.valid?).to eq(false) 
      expect(note.errors[:stacks]).to include(" - Choose at least 1 stack")
      
      # Or test like this with shoulda-matchers:
      expect(Note.new).to validate_presence_of(:stacks).with_message(/ - Choose at least 1 stack/)
    end
  end

  

end
