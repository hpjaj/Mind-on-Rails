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
    expect( page ).to have_content("John Smith")
    click_link 'Sign Out'
    expect( current_path ).to eq '/'
    expect( page ).to_not have_content("John Smith")
  end
end