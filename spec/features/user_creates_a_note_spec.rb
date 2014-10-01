require 'rails_helper'

describe 'User can create one note' do
  
  include Warden::Test::Helpers
  Warden.test_mode!
  
  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  it 'Successfully' do
    visit stacks_index_path
    click_link 'Create A Note'
    expect( current_path ).to eq notes_new_path
    fill_in 'Title', with: "This is the title"
  end

end