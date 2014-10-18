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

      it "redirects to login page" do
        get :index
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq "You are not authorized to perform this action."
      end

    end

    context "when logged in as a standard user" do
    
      it "shows all my public and private notes, only" do
        # create user1 and user 2
        user1 = create(:user)
        user2 = create(:user)
        # create a stack
        stack = create(:stack)
        # create 1 public and 1 private note for user 1
        note1 = create(:note, user: user1, private: true)
        note2 = create(:note, user: user1, private: false)
        # create 1 public and 1 private note for user 2
        note3 = create(:note, user: user2, private: true)
        note4 = create(:note, user: user2, private: false)
        # sign in user 1
        sign_in user1
        # expect @notes to eq user 1s two notes only
        get :index
        expect(assigns(:notes).length).to eq(2)
        expect(assigns(:notes)).to include(note1)
        expect(assigns(:notes)).to include(note2)
        expect(assigns(:notes)).to_not include(note3)
        expect(assigns(:notes)).to_not include(note4)
      end

      # it "orderded by most recently updated first" do
      #   # create stack
      #   # create user
      #   # create note1, setting created at -5 days, updated at -4 days
      #   # create note2, setting create at -5 days, updated at now
      #   # How do you isolate the first displayed note?? it should be note2
      #   # notes = assigns(:notes)
      #   # expect(notes.first).to eq(note2)
      # end

      it "paginated with 5 notes per page" do
        user = create(:user)
        stack = create(:stack)
        6.times { create(:note, user: user) }
        sign_in user
        get :index
        expect(assigns(:notes).length).to eq(5)
      end

    end
  
  end


  describe "GET new", focus: true do
    context "when anonymous user" do
      it "redirects to login page" do
        get :new
        expect( response ).to redirect_to root_path
        expect(flash[:alert]).to eq "You are not authorized to perform this action."
      end
    end

    context "when logged in as a standard user" do
      it "assigns new note" do  #assigns newly instantiated Note object to @note
        user = create(:user)
        sign_in user
        get :new
        expect(assigns(:note)).to be_a_new(Note)
      end
    end
  end


  describe "POST create" do
    context "when anonymous user" do  #not applicable ?
      it "redirects to login page" do
      end
    end

    context "when logged in as a standard user" do
      it "assigns @note to a new note object" do
      end

      it "assigns the new note to the current_user" do
      end

      it "if note saves properly it writes the new note to the database" do
      end

      it "if note does not save properly it renders the note new action" do
      end
    end

    ## am i supposed to be testing for 'authorize @notes' ?

  end


  # describe edit ?
  # describe update ?
  # describe show ?
  # describe destroy ?


  describe "GET search" do 

    before do
        # create user
        # create user2
        # create stack
        # create a public note for user 
        # create a private note for user
        # create a public note for user2 
        # create a private note for user2
    end

    context "when anonymous user" do
      it "only has access to all public notes, across all users" do
        # make sure you are logged out
        # search for public note should show public notes for both users
        # search for private note should note show any private notes
      end
    end

    context "when logged in as a standard user" do
      it "has access to all the users public and private notes" do
        # login as user 1
        # search for note 1 - should see it 
        # search for note 2 - should see it 
        # search for note 3 - should not see it 
        # search for note 4 - should not see it 
      end

      it "has access to all public notes, across all users" do
      end
    end

    context "when anonymous or logged in the results are" do
      it "orderded by most recently updated first" do
        # need to 
      end

      it "paginated with 5 notes per page" do
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
