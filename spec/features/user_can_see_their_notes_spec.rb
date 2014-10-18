require 'rails_helper'

describe 'User clicks My Notes and sees' do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    user = create(:user)
    stack = create(:stack)
    note_1 = create(:note)

    stack_2 = create(:stack, :title => "CSS Styling", id: 2)
    user_2 = create(:user)
    login_as(user_2, scope: :user)
    note_2 = create(:note, :user => user_2, :title => "This is the second note", stack_ids: [2])
    note_3 = create(:note, :user => user_2, :title => "This is the third note", stack_ids: [2])
  end

  xit "create tests for what links you see in nav when logged in vs not logged in" do
  end
  
  it 'Only their notes' do
    visit notes_path
    expect( page ).to_not have_content("This is a note")
    expect( page ).to have_content("This is the second note")
    expect( page ).to have_content("This is the third note")
    expect( page ).to_not have_content("Tricks")
    expect( page ).to have_content("CSS Styling")
  end

end