class StacksController < ApplicationController
  def index
    @stacks = Stack.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
