class Dashboard::TaxClassificationsController < DashboardController
  layout 'dashboard'
  before_action :set_tax_classification, only: %i[edit update destroy]
  
  def index
    @tax_classifications = TaxClassification.all
  end

  def new
    @tax_classification = TaxClassification.new
  end

  def create
    @tax_classification = TaxClassification.new(tax_classifications_params)
    if @tax_classification.save
      redirect_to dashboard_tax_classifications_path, notice: "Classificação cadastrada com sucesso!"
    else
      flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit    
  end

  def update
    if @tax_classification.update(tax_classifications_params)
      redirect_to dashboard_tax_classifications_path, notice: "Classificação alterada com sucesso!"
    else
      flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @tax_classification.destroy(tax_classifications_params)
      redirect_to dashboard_tax_classifications_path, notice: "Classificação apagada com sucesso!"
    else
      flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
      render :edit
    end
  end    

  private

  def set_tax_classification
    @tax_classification = TaxClassification.find(params[:id])
  end

  def tax_classifications_params
    params.require(:tax_classification).permit(:tax_code)
  end
end