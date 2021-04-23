class OrdersController < ApplicationController
  before_action :set_service, only: %I[create]
  before_action :set_order, only: %I[edit]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.service = @service
    if @order.save
      redirect_to edit_order_path(@order)
    else
      @provider = @service.provider
      render "services/show"
    end
  end

  def edit
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:order][:service_id])
  end

  def order_params
    params.require(:order).permit(:guests, :service_id, :delivery, :address,
                                  :apartment, :date, :from, :to, :comments, :paid)
  end
end
