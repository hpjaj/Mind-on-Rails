class StackPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(["public = :boo or user_id = :u_id", { boo: true, u_id: user.id }])
    end

  end
  
  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def new?
    user.present?
  end

  def update?
    create?
  end

  def destroy?
    update?
  end

end