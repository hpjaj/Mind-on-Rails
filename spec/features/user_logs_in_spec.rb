require 'rails_helper'

describe 'User logs in' do

  before do
    @user = create(:user)
  end

  it 'Successfully' do
    visit '/'

    within( '#main-image-container' ) do
      click_link 'Sign In'
    end

    expect( current_path ).to eq new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect( current_path ).to eq notes_path
    expect( page ).to have_content(@user.username)
  end
end