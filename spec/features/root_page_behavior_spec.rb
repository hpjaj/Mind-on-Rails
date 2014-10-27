require 'rails_helper'

describe "the root page" do

  it "sign up button links to the new user registration page" do
    visit "/"
    
    within( '#main-image-container' ) do
      click_link "Sign Up"
    end
    
    expect( current_path ).to eq new_user_registration_path
  end

  it "sign in button links to the new user session page" do
    visit "/"

    within( '#main-image-container' ) do
      click_link "Sign In"
    end

    expect( current_path ).to eq new_user_session_path
  end

end