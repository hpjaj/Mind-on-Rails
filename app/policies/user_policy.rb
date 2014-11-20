class UserPolicy < ApplicationPolicy
  
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
    create?
  end

  def index?
    create?
  end
  
end