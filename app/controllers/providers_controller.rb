class ProvidersController < ApplicationController
  before_action :set_provider, only: %I[show edit update]

  def show
  end

  def new
    @provider = Provider.new
    @categories = Category.all
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to provider_path(@provider)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @provider.update(provider_params)
      redirect_to provider_path(@provider)
    else
      render :edit
    end
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :description, :address, :schedule, category_ids: [])
  end
end
