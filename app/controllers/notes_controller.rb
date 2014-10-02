class NotesController < ApplicationController
  def index
    @notes = Note.all.where(user_id: current_user.id)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    @note.user = current_user
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def show
  end

  private

  def notes_params
    params.require(:note).permit(:title, :body)
  end

end
