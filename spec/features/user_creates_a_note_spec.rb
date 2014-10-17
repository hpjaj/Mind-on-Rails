require 'rails_helper'

describe 'User creates a new note', :js => true  do
  
  include Warden::Test::Helpers
  Warden.test_mode!

  it 'That defaults to Publicly viewable' do
    sign_in_and_opens_a_new_note
    expect( page ).to have_content("Public Note")
    public_note_checkbox = find('#note_public')
    expect( public_note_checkbox ).to be_checked
  end

  it 'Successfully when all validations are met' do
    sign_in_and_opens_a_new_note
    fill_in ':title', with: "This is the title"
    fill_in ':body', with: "This is the body section"
    expect( page ).to have_content("Tricks")
    check("note_stack_ids_1")
    click_button 'Save'
    expect( current_path ).to eq notes_path
    expect( page ).to have_content("Public")
  end

  it 'Unsuccessfully when title, body or stack validation is not met' do
    sign_in_and_opens_a_new_note
    fill_in ':title', with: "Et"
    click_button 'Save'
    expect( page ).to have_content("Title - Minimum length of 5 characters")
    expect( page ).to have_content("Body - Minimum length of 5 characters")
    expect( page ).to have_content("Stacks - Choose at least 1 stack")
    fill_in ':title', with: "123456"
    click_button 'Save'
    expect( page ).to_not have_content("Title - Minimum length of 5 characters")
    fill_in ':body', with: "123456"
    click_button 'Save'
    expect( page ).to_not have_content("Body - Minimum length of 5 characters")
    check("note_stack_ids_1")
    click_button 'Save'
    expect( page ).to_not have_content("Stacks - Choose at least 1 stack")
    expect( current_path ).to eq notes_path
  end


  def sign_in_and_opens_a_new_note
    user = create(:user)
    login_as(user, scope: :user)
    stack = create(:stack)
    visit stacks_path
    click_link 'Create A Note'
    expect( current_path ).to eq new_note_path
  end

end

