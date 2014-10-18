require 'rails_helper'

describe 'User creates an account' do
  it 'Successfully' do
    visit '/'
    click_link 'Sign Up'
    expect( current_path ).to eq new_user_registration_path
    fill_in 'Email', with: 'John Smith'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  xit "create an email spec for the above test" do
  end
  
end