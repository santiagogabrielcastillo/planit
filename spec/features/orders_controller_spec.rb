require 'rails_helper'

RSpec.feature 'orders', type: :feature, js: true do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
    create(:service)
    create(:credit_card)
    login_as(user, scope: :user)
    visit root_path
    find('img.category-img', match: :first).click
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

    context 'when giving valid information' do
      it 'redirects to the order summary page' do
        find('label', text: 'Retiro en local').click
        find('input.input').click
        find('span.today').click
        fill_in 'order_from', with: '08:00'
        fill_in 'order_to', with: '12.00'
        click_on 'Continuar'

        expect(page).to have_content('Resumen')
      end
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

  describe 'Orders index' do
    context 'when clicking on my purchases' do
      it 'lists all the orders I have made' do
        visit '/'
        find('p', text: 'Mis compras').click

        expect(page).to have_current_path(orders_path)
      end
    end
  end

  describe 'Paying an order' do
    context 'when paying an order' do
      it 'shows a success message' do
        click_button '+'
        click_button 'Comprar'
        find('label', text: 'Retiro en local').click
        find('input.input').click
        find('span.today').click
        fill_in 'order_from', with: '08:00'
        fill_in 'order_to', with: '12.00'
        click_on 'Continuar'
        find('input.form-check-input', match: :first).click
        click_on '¡Comprar!'

        expect(page).to have_content('¡Pedido realizado!')
      end
    end
  end
end
