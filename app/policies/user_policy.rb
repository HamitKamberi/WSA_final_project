class UserPolicy < ApplicationPolicy
  def index?
    user_is_admin?
  end

  def show?
    user_is_admin? || user == record
  end
end
