class Api::OrderReportsController < ApplicationController
  before_action :authorize_request
  before_action :authorize_admin, only: [:completed]

  def completed
    @completed_orders = Order.where(status: 'completed')
    render json: @completed_orders
  end

  private

  def authorize_admin
    unless current_user.admin?
      render json: { error: 'Unauthorized' }, status: :forbidden
    end
  end
end
