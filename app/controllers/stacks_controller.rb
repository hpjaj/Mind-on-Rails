class StacksController < ApplicationController
  def index
    @stacks = Stack.all.sort_by_id
    # authorize @stacks
  end

  def new
    @stack = Stack.new
    authorize @stack
  end

  def create
    @stack = Stack.new(stacks_params)
    authorize @stack
    if @stack.save
      redirect_to stacks_path
    else
      render :new
    end
  end

  def edit
    @stack = Stack.find(params[:id])
    authorize @stack
  end

  def update
    @stack = Stack.find(params[:id])
    authorize @stack
    if @stack.update_attributes(stacks_params)
      redirect_to stacks_path
    else
      render :edit
    end
  end

  def show
    @stack = Stack.find(params[:id])
    authorize @stack
    @notes = Note.perform_search(
      page: params[:page],
      user: current_user,
      stack: @stack
    )
    # viewable_notes = @stack.notes.paginate(page: params[:page], per_page: 5).recently_updated_first
    # if current_user
    #   @notes = viewable_notes.where(user_id: current_user.id)
    # else
    #   @notes = viewable_notes.where(public: true)
    # end
  end

  def destroy
    @stack = Stack.find(params[:id])
    authorize @stack
    if @stack.destroy
      redirect_to stacks_path
    else
      render :show
    end
  end

  private

  def stacks_params
    params.require(:stack).permit(:title, :headline, :description, note_ids: [])
  end
end
