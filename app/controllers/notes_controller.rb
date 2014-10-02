class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    if @notice.save
      redirect_to welcome_about_path
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
