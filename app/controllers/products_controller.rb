class ProductsController < ApplicationController
  before_action :category_list, except:[:destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save!
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
     @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
     render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      redirect_to products_url
    end
  end

  private
    def product_params
      params.require(:product).permit(:title, :price, :description, :category_id, :published, :photo)
    end

    def category_list
      @categories = Category.all
    end
end
