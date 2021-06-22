class ProductsController < ApplicationController
  def index
    @All_products = Product.all
  end

  def check_out
    if params[:cart].nil? || params[:cart] == [""]
      redirect_to "/"
    else
      @my_all_elemts = Product.my_cart(params)
    end
  end
end
