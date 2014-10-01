require 'rails_helper'

describe 'User logs out' do

  include Warden::Test::Helpers
  Warden.test_mode!
  
  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  it 'Successfully' do
    visit stacks_index_path
    click_link 'Sign out'
    expect( current_path ).to eq '/'
  end
end