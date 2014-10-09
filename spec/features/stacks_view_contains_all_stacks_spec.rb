require 'rails_helper'

describe 'Clicking Stacks' do

  before do
    stack = create(:stack)
    stack_2 = create(:stack, :title => "CSS Styling", :description => "This is all about the look and feel", id: 2)
    visit stacks_path
  end

  it 'Displays all stacks and their titles' do
    expect( page ).to have_content("Tricks")
    expect( page ).to have_content("CSS Styling")
  end

  it 'Displays all stacks and their descriptions' do
    expect( page ).to have_content("This stack is for tricks in Ruby on Rails")
    expect( page ).to have_content("This is all about the look and feel")
  end
  
end