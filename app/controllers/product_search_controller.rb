class ProductSearchController < ApplicationController
  
  def search
    @products = Product.search(search_params[:q])
  end
  
  private
  
  def search_params
    params.permit(:q)
  end
end



