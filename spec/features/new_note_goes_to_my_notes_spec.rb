require 'rails_helper'

describe 'A newly created note' do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    stack = create(:stack)
    stack_2 = create(:stack, :title => "CSS Styling", :description => "This is all about the look and feel", id: 2)
    stack_3 = create(:stack, :title => "Rails Errors", :description => "Desribe your thought process for translating and debugging rails errors", id: 3)
    user = create(:user)
    login_as(user, scope: :user)
  end

  it 'Does not appear in the associated stacks before being created' do
    visit stacks_path
    click_link "Tricks"
    # expect( current_path ).to eq stacks_path(1)
    expect( page ).to_not have_content("This is a note")
    visit stacks_path
    click_link "CSS Styling"
    # expect( current_path ).to eq stacks_path(2)
    expect( page ).to_not have_content("This is a note")
  end

  it 'Does not appear in My Notes before being created' do
    visit notes_path
    expect( page ).to_not have_content("This is a note")
  end

  it 'Instantly displays in My Notes view' do
    note = create(:note, stack_ids: [1,2])
    visit notes_path
    expect( page ).to have_content("This is a note")
  end

  it 'Instanlty displays in the respective single stack views' do
    # visit stacks_path(1)
    expect( page ).to have_content("This is a note")
    # visit stacks_path(2)
    expect( page ).to have_content("This is a note")
  end

  it 'Does not appear in a stack it is not associated with' do
    # visit stacks_path(3)
    expect( page ).to_not have_content("This is a note")
  end

end