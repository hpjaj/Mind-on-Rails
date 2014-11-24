require 'rails_helper'

describe 'The Previous and Next links from the notes show view' do

  include Warden::Test::Helpers
  Warden.test_mode!

  context 'as an anonymous guest' do
    context 'when visiting the trending page' do 

      before do
        @user = create(:user)
        @stack = create(:stack)
        @note1 = create(:note, title: 'This is the first note', public: true, rank: 40_000)
        @note2 = create(:note, title: 'This is the second note', public: true, rank: 30_000)
        @note3 = create(:note, title: 'This is the third note', public: true, rank: 20_000)
        visit trending_path
        # should see the first, second and third notes' titles
        # click the second note's title
        click_link 'This is the second note'
        # should no longer see the first note's title
        expect( current_path ).to eq(note_path(@note2))
      end

      it 'the Previous link brings you to the previous public note, based on the current results set' do
        # click the Previous link
        # should see the first note's title
        # should not see the second notes title
      end

      it 'the Next link brings you to the next public note, based on the current results set' do
        # click the Next link
        # should see the third note's title
        # should not see the second notes title
      end

    end

    it 'do not appear when using the search feature' do
      # visit the search page
      # enter a search that yields multiple results 
      # verify that you see multiple results
      # click the title of the second result
      # should no longer see the other results
      # should see the title of the second note
      # should not see the previous button
      # should not see the next button
    end

  end

  context 'as a signed in user' do
    context 'when visiting the My Notes page' do

      before do
        @user = create(:user)
        @stack = create(:stack)
        # login
        @note4 = create(:note, title: 'This is the fourth note', public: false) # add updated_at here
        @note5 = create(:note, title: 'This is the fifth note', public: false)
        @note6 = create(:note, title: 'This is the sixth note', public: false)
        visit trending_path
        # should see the fourth, fifth and sixth notes' titles
        # click the fifth note's title
        # should no longer see the fourth note's title
      end

      it 'the Previous link brings you to your previous note, based on the current results set' do
        # click the Previous link
        # should see the fourth note's title
        # should not see the fifth notes title
      end

      it 'the Next link brings you to your next note, based on the current results set' do
        # click the Next link
        # should see the sixth note's title
        # should not see the fifth notes title
      end

    end

    it 'do not appear when using the search feature nor the search from My Notes' do
    end

  end

end


