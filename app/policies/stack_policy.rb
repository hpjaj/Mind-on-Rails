class StackPolicy < ApplicationPolicy
  
  def create?
    user.present? && user.admin?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  def show?
    true
  end

  def index
    true
  end
  
end