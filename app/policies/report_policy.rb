class ReportPolicy < Struct.new(:user, :report)
  def view?
    user.admin? || user.advanced_user?
  end
end
