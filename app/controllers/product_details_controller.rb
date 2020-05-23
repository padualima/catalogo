class ProductDetailsController < ApplicationController

  def show
    @groups = Group.order(:group_description)
    @product = Product.friendly.find(params[:id])
  end
end