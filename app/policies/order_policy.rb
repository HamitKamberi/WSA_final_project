class OrderPolicy < ApplicationPolicy
  def index?
    user.admin? || user.advanced_user?
  end

  def show?
    user.admin? || user.advanced_user? || user == record.client
  end

  def create?
    user.present?
  end

  def update?
    user.admin? || user.advanced_user?
  end

  def destroy?
    user.admin?
  end
end
