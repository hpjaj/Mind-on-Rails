class FlashcardsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @flashcards = current_user.flashcards
  end

  def create
    @note = Note.find(params[:note_id])
    flashcard = current_user.flashcards.build(note: @note)
    authorize flashcard
    if flashcard.save
      redirect_to @note
    else
      flash[:error] = "The flashcard did not save. Please try again."
      redirect_to @note
    end
  end

  def destroy
    @note = Note.find(params[:note_id])
    flashcard = current_user.flashcards.find(params[:id])
    authorize flashcard
    if flashcard.destroy
      redirect_to :back
    else
      flash[:error] = "Was not able to un-flashcard this.  Please try again."
      redirect_to @note
    end
  end

end
