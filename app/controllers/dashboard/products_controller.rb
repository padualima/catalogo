class Dashboard::ProductsController < DashboardController
  layout 'dashboard'
  before_action :set_products, only: %i[edit update]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to dashboard_products_path, notice: "#{@product.product_description} cadastrado com sucesso!"
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(products_params)
      redirect_to dashboard_products_path, notice: "#{@product.product_description} atualizado com sucesso!"
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence
      render :edit
    end
  end


  private


  def set_products
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:product_code, :product_description, :product_ean, :product_dun, :display_ean, :status,
     :releases, :family_id, :tax_classification_id, :group_id, :generic_id, :image)
  end
end