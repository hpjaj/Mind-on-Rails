require 'rails_helper'

RSpec.describe NotesController, :type => :controller do
  include Devise::TestHelpers

  describe "GET index" do
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:note)).to be_a_new(Note)
    end
  end

  describe "GET show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
