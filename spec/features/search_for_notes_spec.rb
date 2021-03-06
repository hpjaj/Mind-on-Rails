require 'rails_helper'

describe "searching for notes from the search page" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user1 = create(:user)
    @user2 = create(:user)
    stack = create(:stack)
    note1 = create(:note, user: @user1, public: false,  title: 'CSS info',     body: 'Thinks about all things')
    note3 = create(:note, user: @user2, public: false,  title: 'CSS way',      body: 'Thinks about all worlds')
    note2 = create(:note, user: @user1, public: true, title: 'CSS styling',  body: 'Thinks about all people')
    note4 = create(:note, user: @user2, public: true, title: 'CSS trickery', body: 'Thinks about all personas')
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

    it "the search placeholder says 'Search public notes'" do
      #capybara can find a field by the placeholder text; therefore,
      #the below test confirms the correct placeholder text
      fill_in 'Search public notes', with: 'go'
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

    it "the search placeholder says 'Search my notes & public notes'" do
      #capybara can find a field by the placeholder text; therefore,
      #the below test confirms the correct placeholder text
      fill_in 'Search my notes & public notes', with: 'go'
    end

    it "prompts user with a message if there are no matching results" do
      fill_in('query', with: 'django')
      click_button ('search-submit-button')
      expect( page ).to have_content('There are not any notes that match your search criteria.')
      expect( page ).to_not have_content('personas')
      expect( page ).to_not have_content('things')
      expect( page ).to_not have_content('worlds')
      expect( page ).to_not have_content('people')
    end
  end

  # context "as a logged in admin" do
  #   it "has access to all all users public and private notes" do
  #   end
  # end

end
