require 'rails_helper'

describe 'User logs out' do

  include Warden::Test::Helpers
  Warden.test_mode!
  
  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  it 'Successfully' do
    visit stacks_path
    click_link @user.name || @user.email
    click_link 'Sign Out'
    expect( current_path ).to eq '/'
  end
end