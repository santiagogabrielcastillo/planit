class OrdersController < ApplicationController
  before_action :set_service, only: %I[create]
  before_action :set_order, only: %I[edit update confirm paid show]

  def index
    @orders = Order.where(user: current_user)
  end

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

  def update
    if @order.update(order_params)
      redirect_to confirm_order_path(@order)
    else
      render :edit
    end
  end

  def confirm
  end

  def paid
    @order.paid = true
    @order.save
    redirect_to success_path
  end

  def show
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
