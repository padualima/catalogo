class DashboardController < ApplicationController
  layout "dashboard"

  def index
    @products = Product.all.count
    @products_releases = Product.releases_true
    @products_status = Product.status_true
  end
end
