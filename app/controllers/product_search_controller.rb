class ProductSearchController < ApplicationController

  def search
    @products = Product.all
    @groups = Group.order(:group_description)
    @products = Product.search(search_params[:q])
  end
  
  private
  
  def search_params
    params.permit(:q)
  end
end



