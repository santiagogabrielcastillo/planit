class CreditCardsController < ApplicationController
  before_action :set_credit_card, only: %I[edit update destroy]
  before_action :set_user, only: %I[new create edit]

  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user = current_user
    if @credit_card.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @credit_card.update(credit_card_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @credit_card.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = current_user
  end

  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end

  def credit_card_params
    params.require(:credit_card).permit(:number, :name, :expire)
  end
end
