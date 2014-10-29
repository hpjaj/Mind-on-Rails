require 'rails_helper'

describe 'User creates an account' do
  
  it 'Successfully' do
    visit '/'
    reset_mailer

    within( '#main-image-container' ) do
      click_link "Sign Up"
    end

    expect( current_path ).to eq new_user_registration_path
    fill_in 'Name', with: 'John Smith'
    fill_in 'Username', with: 'jsmith'
    fill_in 'Email', with: 'johnsmith@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect( page ).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
    expect(unread_emails_for('johnsmith@example.com').count).to eq(1)
    open_email('johnsmith@example.com')
    expect( current_email ).to have_body_text("You can confirm your account email through the link below")
    click_email_link_matching(/\/users\/confirmation\?confirmation_token=/)
    expect( current_path ).to eq new_user_session_path
    expect( page ).to have_content("Your email address has been successfully confirmed.")
    fill_in 'Email', with: 'johnsmith@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect( current_path ).to eq notes_path
    expect( page ).to have_content('jsmith')
  end

  it "prevents duplicate email" do
    user = create(:user, email: 'tom@example.com')
    visit '/'
    reset_mailer
    
    within( '#main-image-container' ) do
      click_link "Sign Up"
    end
    expect( current_path ).to eq new_user_registration_path
    fill_in 'Name', with: 'Tom Selleck'
    fill_in 'Username', with: 'tomselleck'
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect( page ).to have_content('Email has already been taken')
  end

  it "prevents duplicate username" do
    user = create(:user, username: 'tomselleck')
    visit '/'
    reset_mailer
    
    within( '#main-image-container' ) do
      click_link "Sign Up"
    end
    
    expect( current_path ).to eq new_user_registration_path
    fill_in 'Name', with: 'Tom Selleck'
    fill_in 'Username', with: 'tomselleck'
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect( page ).to have_content('- This username has already been taken')
  end

end