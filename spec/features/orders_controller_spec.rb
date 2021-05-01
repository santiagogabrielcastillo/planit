require 'rails_helper'

RSpec.feature "OrdersControllers", type: :feature, js: true do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
    create(:service)
    login_as(user, scope: :user)
    visit root_path
    find('img.category-img').click
    find('h3', text: 'La Pasionaria Cocina').find(:xpath, '..').click
    find('h4', text: 'Brunch completo').click
  end

  describe 'New order proccess' do
    context 'with guests > 0' do
      it 'generates a new order and redirect to the edit order page' do
        click_button '+'
        click_button 'Comprar'

        expect(page).to have_content 'Tipo de entrega'
        expect(page).to have_current_path(edit_order_path(Order.first.id))
      end
    end

    context 'without selecting number of guests' do
      it 'displays an error message' do
        click_button 'Comprar'

        expect(page).to have_content 'Guests must be greater than or equal to 1'
      end
    end
  end

  describe "Giving order's details" do
    before(:each) do
      click_button '+'
      click_button 'Comprar'
    end

    context 'when selecting home delivery and giving no address' do
      it 'displays an error message' do
        find('label', text: 'A domicilio').click
        click_on 'Continuar'

        expect(page).to have_content("Address can't be blank")
      end
    end

    context 'when giving no date' do
      it 'shows an error message' do
        find('label', text: 'Retiro en local').click
        click_on 'Continuar'

        expect(page).to have_content("Date can't be blank")
      end
    end
  end
end
