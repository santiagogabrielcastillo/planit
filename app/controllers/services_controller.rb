class ServicesController < ApplicationController
  before_action :set_provider, only: %I[new create show edit update]
  before_action :set_service, only: %I[show edit update]

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
    @order = Order.new
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to provider_service_path(@provider, @service)
    else
      render :edit
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_provider
    @provider = Provider.find(params[:provider_id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :cost, :photo, :provider_id)
  end
end
