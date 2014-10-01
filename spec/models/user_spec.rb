require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it "has many notes" do
    user = create(:user)
    note = user.notes.build

    user.reload
    expect(user.notes).to eq([note])
  end

end
