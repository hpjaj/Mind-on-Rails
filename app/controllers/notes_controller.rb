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


#   def search
#     notes = Note.text_search(params[:query]).paginate(page: params[:page], per_page: 5).recently_updated_first
#     users_notes = notes.where(user_id: current_user.id)
#     public_notes = notes.where(public: true)

#     if current_user
#       @notes = users_notes + public_notes
#     else
#       @notes = public_notes
#     end
#   end

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



# I have an app where users create public and private notes.  For a guest, I want the note set to contain only public notes. 

# For a user, I want the note set to contain all public notes **plus** all the user's notes.

# Here is my code from the `notes_controller`:

# ```ruby
#   def search
#     notes = Note.text_search(params[:query]).paginate(page: params[:page], per_page: 5).recently_updated_first
#     users_notes = notes.where(user_id: current_user.id)
#     public_notes = notes.where(public: true)

#     if current_user
#       @notes = users_notes + public_notes
#     else
#       @notes = public_notes
#     end
#   end```
# 
# I am getting this error:

# ```bash
# NoMethodError in Notes#search
# Showing /Users/harrylevine/Documents/Coding_Files/MoR/app/views/notes/search.html.erb where line #16 raised:

# undefined method `total_pages' for #<Array:0x007fa4e2374c20>
# ```

# Background info, all the search functionality and pagination was working before I tried to differentiate public and private.  Thanks.