class ServicesController < ApplicationController
  before_action :set_provider, only: %I[new create show]

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.provider = @provider
    if @service.save
      redirect_to provider_service_path(@provider, @service)
    else
      render :new
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  private

  def set_provider
    @provider = Provider.find(params[:provider_id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :cost, :provider_id)
  end
end
