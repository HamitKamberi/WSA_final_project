class ProductPolicy < ApplicationPolicy
  def index?
    true  # Allow everyone to view products (you can customize this)
  end

  def show?
    true  # Allow everyone to see a product (you can customize this)
  end

  def create?
    puts "User: #{user.inspect}, Admin: #{user.admin?}"  # Debug line
    user.admin?
  end

  def update?
    puts "User: #{user.inspect}, Admin: #{user.admin?}"  # Debug line
    user.admin?
  end

  def destroy?
    puts "User: #{user.inspect}, Admin: #{user.admin?}"  # Debug line
    user.admin?
  end
end
