class ProductsController < ApplicationController

  def index
    @products = Product.all
    @usa_products = Product.buy_usa
    render :index
  end

  # def buy_usa
  #   if params[:usa]
  #     @products = Product.buy_usa
  #   end
  #   render :index
  # end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end




  def show
    @product = Product.find(params[:id])
    # @artist = Artist.find(params[:id])
    # @artists = Artist.all
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
