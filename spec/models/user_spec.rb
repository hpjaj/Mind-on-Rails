require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "associations" do
    it "has many notes" do
      expect(User.new).to have_many(:notes).dependent(:destroy)
    end
  end

  describe "validations" do
    it "validates the uniqueness of a username" do
      original_user = create(:user, username: 'thatguyoffthatshow')
      dupe_user = build(:user, username: 'thatguyoffthatshow')

      expect(dupe_user.valid?).to eq(false)
      expect(dupe_user.errors[:username]).to eq(['- This username has already been taken'])
    end
  end
end
