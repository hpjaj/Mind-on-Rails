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

  describe ".perform_search" do
    context "with query" do

      it "returns no results when there are no matches on title" do
        # create note with content x
        note = create(:note_with_stack, title: "Rails migrations")
        # search for note with content y
        results = Note.perform_search(query: "Ruby")
        # yields no results
        expect( results ).to be_empty
      end

      it "returns no results when there are no matches on body" do
        note = create(:note_with_stack, body: "Rails migrations")
        results = Note.perform_search(query: "Ruby")
        expect( results ).to be_empty
      end

      it "returns a match on title" do
        note = create(:note_with_stack, title: "Rails migrations")
        results = Note.perform_search(query: "Rails")
        expect( results ).to eq([note])
      end

      it "returns a match on body" do
        note = create(:note_with_stack, body: "Rails migrations")
        results = Note.perform_search(query: "Rails")
        expect( results ).to eq([note])
      end

    end

    context "pagination" do

      it "returns the first page" do
        create(:stack)
        create_list(:note, 3)
        results = Note.perform_search(per_page: 1, page: 1)
        expect(results.current_page.to_i).to eq(1)
        expect(results.per_page).to eq(1)
        expect(results.total_pages).to eq(3)
      end

      it "returns the last page" do
        create(:stack)
        create_list(:note, 3)
        results = Note.perform_search(per_page: 1, page: 3)
        expect(results.current_page.to_i).to eq(3)
        expect(results.per_page).to eq(1)
        expect(results.total_pages).to eq(3)
      end

    end
  end

  describe "vote methods" do

    before do
      @stack = create(:stack)
      @note = create(:note)
      3.times { @note.votes.create(value: 1) }
      2.times { @note.votes.create(value: -1) }
    end

    describe '#up_votes' do
      it "counts the number of votes with value = 1" do
        expect( @note.up_votes ).to eq(3)
      end
    end

    describe '#down_votes' do
      it "counts the number of votes with value = -1" do
        expect( @note.down_votes ).to eq(2)
      end
    end

    describe '#points' do
      it "returns the sum of all down and up votes" do
        expect( @note.points ).to eq(1)
      end
    end

    describe '#create_vote' do
      it "generates an up-vote when explicity called" do
        note = create(:note)
        expect( note.up_votes ).to eq(0)
        note.create_vote
        expect( note.up_votes ).to eq(1)
      end
    end

  end

end
