require 'rails_helper'

describe "searching from My Notes" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user1 = create(:user)
    login_as(@user1, scope: :user)
    visit notes_path
  end

  context "when user has no notes" do

    it "prompts user to create a note if they have created no notes" do
      expect( current_path ).to eq(notes_path)
      expect( page ).to have_content('Create your first note')
    end
  end 

  context "when user has notes" do

    before do
      @user2 = create(:user)
      stack = create(:stack)
      note1 = create(:note, :user => @user1, public: true, title: 'First note')
      note2 = create(:note, :user => @user1, public: false, title: 'Second note')
      note3 = create(:note, :user => @user2, public: true, title: 'Third note')
      note4 = create(:note, :user => @user2, public: false, title: 'Fourth note')
    end

    it "only searches users notes" do
      fill_in('query', with: 'note')
      click_button ('search-submit-button')
      expect( page ).to have_content('First note')
      expect( page ).to have_content('Second note')
      expect( page ).to_not have_content('Third note')
      expect( page ).to_not have_content('Fourth note')
    end

    it "prompts user with a message if there are no matching results" do
      fill_in('query', with: 'django')
      click_button ('search-submit-button')
      expect( page ).to have_content('None of your notes match that search criteria.')
      expect( page ).to_not have_content('First note')
      expect( page ).to_not have_content('Second note')
      expect( page ).to_not have_content('Third note')
      expect( page ).to_not have_content('Fourth note')
    end

  end

  

end