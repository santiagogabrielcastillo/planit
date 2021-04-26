class CreditCardsController < ApplicationController
  before_action :set_user, only: %I[new create]
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

  private

  def set_user
    @user = current_user
  end

  def credit_card_params
    params.require(:credit_card).permit(:number, :name, :expire)
  end
end
