class Api::OrdersController < ApplicationController
  before_action :authorize_request
  before_action :set_order, only: [:show, :update]
  before_action :authorize_update_order, only: [:update]

  # GET /api/orders
  def index
    @orders = Order.all
    render json: @orders
  end

  # GET /api/orders/:id
  def show
    render json: @order
  end

  # POST /api/orders
  def create
    @order = Order.new(order_params)
    @order.client_id = current_user.id
    if @order.save
      puts "Order saved successfully. Processing stock update..."
      @order.order_items.each do |item|
        product = Product.find_by(id: item.product_id)
        if product
          puts "Updating stock for product ##{product.id}. Current stock: #{product.stock}, Ordered quantity: #{item.quantity}"
          product.update(stock: product.stock - item.quantity)
        else
          puts "Product not found for item: #{item.product_id}"
        end
      end
      render json: @order, status: :created
    else
      puts "Order save failed: #{@order.errors.full_messages}"
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  

  # PATCH/PUT /api/orders/:id
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def authorize_update_order
    unless current_user.admin? || current_user.advanced_user?
      render json: { error: 'Unauthorized to update orders' }, status: :forbidden
    end
  end

  def order_params
    params.require(:order).permit(:status, :client_id, :product_id, order_items_attributes: [:product_id, :quantity])
  end
end
