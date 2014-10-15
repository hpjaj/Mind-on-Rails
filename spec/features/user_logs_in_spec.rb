require 'rails_helper'

describe 'User logs in' do

  before do
    @user = create(:user)
  end

  it 'Successfully' do
    visit '/'
    click_link 'Sign In'
    expect( current_path ).to eq new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect( current_path ).to eq stacks_path
    expect( page ).to have_content("John Smith")
  end
end