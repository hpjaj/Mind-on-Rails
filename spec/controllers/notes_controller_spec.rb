require 'rails_helper'

RSpec.describe NotesController, :type => :controller do
  include Devise::TestHelpers

  # before do
  #   @user = create(:user)
  #   sign_in @user
  #   @stack = create(:stack)
  #   @note = create(:note)
  # end

  describe "GET index" do

    context "when anonymous user" do

      it "redirects to login page", focus: true do
        get :index
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq "You are not authorized to perform this action."
      end

    end

  end

  # describe "GET index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #     # expect(assigns(:note)).to be_a_new(Note)
  #   end
  # end

  # describe "POST create" do
  #   it "assigns @note to Note.new" do
  #     expect(assigns(:note)).to be_a_new(Note)
  #   end

  # end

  # describe "GET show" do
  #   xit "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end



end
