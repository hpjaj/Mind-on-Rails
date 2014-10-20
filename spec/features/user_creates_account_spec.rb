require 'rails_helper'

describe 'User creates an account', focus: true do
  
  it 'Successfully' do
    visit '/'
    reset_mailer
    click_link 'Sign Up'
    expect( current_path ).to eq new_user_registration_path
    fill_in 'Name', with: 'John Smith'
    fill_in 'Username', with: 'jsmith'
    fill_in 'Email', with: 'JohnSmith@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect( page ).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
    # expect(unread_emails_for(user.email).count).to eq(1)

    user = User.find_by(username: "jsmith")
    expect(user.name).to eq("John Smith")
  end

  it "prevents duplicate email" do
    user = create(:user, email: 'tom@example.com')
    visit '/'
    reset_mailer
    click_link 'Sign Up'
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
    click_link 'Sign Up'
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