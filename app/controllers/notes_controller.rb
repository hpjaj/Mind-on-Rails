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

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(notes_params)
      redirect_to note_path
    else
      render :edit
    end
    
  end

  def show
    @note = Note.find(params[:id])
  end

  private

  def notes_params
    params.require(:note).permit(:title, :body)
  end

end
