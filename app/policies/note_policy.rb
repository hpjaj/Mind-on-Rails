class NotePolicy < ApplicationPolicy
  
  def create?
    puts "#{user.present?} #{record.user} #{user}"
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