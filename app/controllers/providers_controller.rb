class ProvidersController < ApplicationController
  def show
    @provider = Provider.find(params[:id])
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to provider_path(@provider)
    else
      render :new
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :description, :address, :schedule, :delivery, :categories)
  end
end
