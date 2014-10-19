class VotesController < ApplicationController

  before_action :load_note_and_vote

  def up_vote
    update_vote!(1)
    # http://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
  end

  def down_vote
    update_vote!(-1)
    # http://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
  end

  private

  def load_note_and_vote
    @note = Note.find(params[:note_id])
    @vote = @note.votes.where(user_id: current_user.id).first
  end

  def update_vote!(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.build(value: new_value, note: @note)
      authorize @vote, :create?
      @vote.save
    end
  end

end