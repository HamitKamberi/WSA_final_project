class Api::ProductsController < ApplicationController
  before_action :authorize_request
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authorize_create_product, only: [:create]

  # GET /api/products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /api/products/:id
  def show
    render json: @product
  end

  # POST /api/products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/products/:id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  # GET /api/products/search
  def search
    @products = Product.all
  
    if params[:category]
      @products = @products.where(category_id: params[:category])
    end
  
    if params[:gender]
      @products = @products.where(gender: params[:gender])
    end
  
    if params[:brand]
      @products = @products.where(brand_id: params[:brand])
    end
  
    if params[:size]
      @products = @products.where(size_id: params[:size])
    end
  
    if params[:color]
      @products = @products.where(color_id: params[:color])
    end

    if params[:price_min]
      @products = @products.where("price >= ?", params[:price_min])
    end

    if params[:price_max]
      @products = @products.where("price <= ?", params[:price_max])
    end
  
    render json: @products
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def authorize_create_product
    unless current_user.admin?
      render json: { error: 'Unauthorized to create products' }, status: :forbidden
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category, :brand, :size, :color, :gender)
  end
end
