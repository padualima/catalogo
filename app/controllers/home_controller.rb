class HomeController < ApplicationController
  def index
    @products = Product.limit(9).releases_home
    @groups = Group.order(:group_description)
  end
end
