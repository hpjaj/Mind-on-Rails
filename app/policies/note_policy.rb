class NotePolicy < ApplicationPolicy
  
  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    create?
  end

  def destroy?
    update?
  end

end