class NotesController < ApplicationController

  def index
    authorize Note
    # @notes = Note.paginate(page: params[:page], per_page: 5).only_this_users_notes(current_user).recently_updated_first
    # @notes = current_user.notes.recently_updated_first.paginate(page: params[:page], per_page: 5)
    @notes = Note.perform_search(page: params[:page], user: current_user, only_user_owned_notes: true)
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
      @note.create_vote
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
    if current_user
      @note = Note.find(params[:id])
    elsif Note.find(params[:id]).public
        @note = Note.find(params[:id])
    else
      redirect_to stacks_path
    end
  end

  def search
    search_options = {
      query: params[:query], 
      page: params[:page], 
      user: current_user
    }
    @notes = Note.perform_search(search_options)
  end

  def trending
    @notes = Note.all.where(public: true).rank_by_vote_count.paginate(page: params[:page], per_page: 10)
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

