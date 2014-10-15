class NotesController < ApplicationController
  def index
    @notes = Note.paginate(page: params[:page], per_page: 5).where(user_id: current_user.id).recently_updated_first
  end

  def new
    @note = Note.new
    authorize @note
  end

  def create
    @note = Note.new(notes_params)
    @note.user = current_user
    authorize @note
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
    authorize @note
  end

  def update
    @note = Note.find(params[:id])
    authorize @note
    if @note.update_attributes(notes_params)
      redirect_to note_path
    else
      render :edit
    end
    
  end

  def show
    @note = Note.find(params[:id])
  end

  def search
    notes = Note.text_search(params[:query]).paginate(page: params[:page], per_page: 5).recently_updated_first
    if current_user
      @notes = notes.where(user_id: current_user.id)
    else
      @notes = notes.where(public: true)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    authorize @note
    if @note.destroy
      redirect_to notes_path
    else
      render :show
    end
  end

  private

  def notes_params
    params.require(:note).permit(:title, :body, :public, stack_ids: [])
  end

end
