class Api::ReportsController < ApplicationController
  before_action :authorize_request

  # GET /api/reports/earnings
  def earnings
    authorize :report, :view?
    # Logic to calculate daily/monthly earnings
    render json: { earnings: calculate_earnings }
  end

  # GET /api/reports/top_selling
  def top_selling
    authorize :report, :view?
    # Logic to calculate top-selling products
    render json: { top_selling: calculate_top_selling }
  end

  private

  def calculate_earnings
    # Sample calculation (replace with actual logic)
    Order.where(status: 'completed').group_by_day(:created_at).sum(:total_price)
  end

  def calculate_top_selling
    # Sample calculation (replace with actual logic)
    Product.joins(:orders).group(:id).order('count_all DESC').count
  end
end
