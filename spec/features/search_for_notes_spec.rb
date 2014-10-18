require 'rails_helper'

describe "searching for notes" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user1 = create(:user)
    @user2 = create(:user)
    stack = create(:stack)
    note1 = create(:note, user: @user1, private: true,  title: 'CSS info',     body: 'Thinks about all things')
    note3 = create(:note, user: @user2, private: true,  title: 'CSS way',      body: 'Thinks about all worlds')
    note2 = create(:note, user: @user1, private: false, title: 'CSS styling',  body: 'Thinks about all people')
    note4 = create(:note, user: @user2, private: false, title: 'CSS trickery', body: 'Thinks about all personas')
  end

  context "as an anonymous guest" do

    before do
      visit "/"
      click_link ("search-icon")
    end

    it "has access to all users public notes, only, through title search" do
      fill_in('query', with: 'CSS') 
      click_button ('search-submit-button')
      expect( page ).to have_content('styling')
      expect( page ).to have_content('trickery')
      expect( page ).to_not have_content('info')
      expect( page ).to_not have_content('way')
    end

    it "has access to all users public notes, only, through body search" do
      fill_in('query', with: 'Thinks about all') 
      click_button ('search-submit-button')
      expect( page ).to have_content('people')
      expect( page ).to have_content('personas')
      expect( page ).to_not have_content('things')
      expect( page ).to_not have_content('worlds')
    end
  end

  context "as a logged in standard user" do

    before do
      login_as(@user1, scope: :user)
      visit "/"
      click_link ("search-icon")
    end

    it "has access to all of your own public and private notes" do
      fill_in('query', with: 'CSS') 
      click_button ('search-submit-button')
      expect( page ).to have_content('styling')
      expect( page ).to have_content('info')
      expect( page ).to_not have_content('way')
    end

    it "has access to all users public notes" do
      fill_in('query', with: 'Thinks about all') 
      click_button ('search-submit-button')
      expect( page ).to have_content('personas')
      expect( page ).to have_content('things')
      expect( page ).to_not have_content('worlds')
    end
  end

  context "as a logged in admin" do
    xit "has access to all all users public and private notes" do
    end
  end

end












