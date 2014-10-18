require 'rails_helper'

describe 'A single stack view' do

  before do
    @stack = create(:stack)
    stack_2 = create(:stack, :title => "CSS Styling", :description => "This is all about the look and feel", id: 2)
    @note = create(:note)
    note_2 = create(:note, :title => "This is the second note", stack_ids: [1])
    # note_2 = create(:note, :title => "This is the second note", stacks: [stack]) 
    note_3 = create(:note, :title => "This is the third note", stack_ids: [2])
    visit stacks_path
  end

  xit "create context for anonymous and user" do
  end
  
  it "Contains all notes with that Stack's ID" do
    click_link 'Tricks'
    expect( current_path ).to eq stack_path(@stack)
    expect( page ).to_not have_content("CSS STYLING")
    expect( page ).to_not have_content("This is the third note")
    expect( page ).to have_content("TRICKS")
    expect( page ).to have_content("This is a note")
    expect( page ).to have_content("This is the second note")
    expect( page ).to have_content("This stack is for tricks in Ruby on Rails")
  end
end