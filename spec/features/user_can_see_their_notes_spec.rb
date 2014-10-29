require 'rails_helper'

describe 'User clicks My Notes and sees' do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    user1 = create(:user)
    stack1 = create(:stack, id: 1)
    note1 = create(:note, :user => user1, :title => "This is the first note", stack_ids: [1], public: true)
    note2 = create(:note, :user => user1, :title => "This is the second note", stack_ids: [1], public: false)

    stack2 = create(:stack, :title => "CSS Styling", id: 2)
    user2 = create(:user)
    login_as(user2, scope: :user)
    note3 = create(:note, :user => user2, :title => "This is the third note", stack_ids: [2])
    note4 = create(:note, :user => user2, :title => "This is the fourth note", stack_ids: [2])
  end
  
  it 'Only their notes' do
    visit notes_path
    expect( page ).to_not have_content("This is the first note")
    expect( page ).to_not have_content("This is the second note")
    expect( page ).to have_content("This is the third note")
    expect( page ).to have_content("This is the fourth note")
    expect( page ).to_not have_content("Tricks")
    expect( page ).to have_content("CSS Styling")
  end

end