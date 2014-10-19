require 'rails_helper'

describe "Top navbar links" do

  include Warden::Test::Helpers
  Warden.test_mode!
  
  before do
    @user = create(:user)
  end

  context "give access to Mind on Rails, About, Stacks, and Search pages" do

    it "to anonymous guests" do
      visit "/"
      test_guest_access_links
    end

    it "to standard logged in users" do
      login_as(@user, scope: :user)
      visit "/"
      test_guest_access_links
    end
  end

  context "for an anonymous guest" do
    it "clicking Mind on Rails brings you to the root page" do

    end 
    it "directs the Mind on Rails link to the root page" do
      visit "/"
      click_link "Mind on Rails"
      expect( current_path ).to eq root_path
    end

    it "gives access to the Log In link" do
      visit "/"
      click_link "Log In"
      expect( current_path ).to eq new_user_session_path
    end
  end

  context "for a logged in standard user" do

    before do
      login_as(@user, scope: :user)
      visit "/"
    end

    it "directs the Mind on Rails link to the stacks index page" do
      click_link "Mind on Rails"
      expect( current_path ).to eq stacks_path
    end

    it "can additionally access Create a Note, My Notes, Edit Profile, and Sign Out" do
      click_link "+ Create A Note"
      expect( current_path ).to eq new_note_path
      click_link "My Notes"
      expect( current_path ).to eq notes_path
      click_link @user.name
      click_link 'Edit'
      expect( current_path ).to eq edit_user_registration_path
    end
  end

  def test_guest_access_links
    click_link "Mind on Rails"
    click_link "About"
    expect( current_path ).to eq about_path
    click_link "Stacks"
    expect( current_path ).to eq stacks_path
    click_link "search-icon"
    expect( current_path ).to eq search_path
  end

end

















