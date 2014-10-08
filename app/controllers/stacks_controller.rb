class StacksController < ApplicationController
  def index
    @stacks = Stack.all
  end

  def new
    @stack = Stack.new
  end

  def create
    @stack = Stack.new(stacks_params)
    if @stack.save
      redirect_to stacks_path
    else
      render :new
    end
  end

  def edit
    @stack = Stack.find(params[:id])
  end

  def update
    @stack = Stack.find(params[:id])
    if @stack.update_attributes(stacks_params)
      redirect_to stacks_path
    else
      render :edit
    end
  end

  def show
    @stack = Stack.find(params[:id])
    @notes = @stack.notes.paginate(page: params[:page], per_page: 5).recently_updated_first
  end

  private

  def stacks_params
    params.require(:stack).permit(:title, :description, :note)
  end
end
