require 'rails_helper'

describe 'A single stack view', focus: true do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user  = create(:user)
    @stack = create(:stack, :title => "Tricks",      :description => "This stack is for tricks in Ruby on Rails", id: 1)
    stack2 = create(:stack, :title => "CSS Styling", :description => "This is all about the look and feel",       id: 2)
    @note  = create(:note, private: true,  :title => "This is the first note",  stack_ids: [1])
    note2  = create(:note, private: false, :title => "This is the second note", stack_ids: [1])
    note3  = create(:note, private: false, :title => "This is the third note",  stack_ids: [2])
    # note_2 = create(:note, :title => "This is the second note", stacks: [stack]) 
  end

  after(:each) do
      expect( current_path ).to eq stack_path(@stack)
      expect( page ).to have_content("TRICKS")
      expect( page ).to have_content("This is the second note")
      expect( page ).to have_content("This stack is for tricks in Ruby on Rails")
      expect( page ).to_not have_content("CSS STYLING")
      expect( page ).to_not have_content("This is the first note")
      expect( page ).to_not have_content("This is the third note")
    end

  context "as an anonymous guest" do
    it "contains all public notes with that Stack's ID" do
      visit stacks_path
      click_link 'Tricks'
    end
  end
  
  context "as a logged in standard user" do
    it "contains all notes with that Stack's ID" do
      login_as(@user, scope: :user)
      visit stacks_path
      click_link 'Tricks'
      expect( page ).to have_content("This is the second note")
    end
  end

end