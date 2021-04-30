require 'rails_helper'

RSpec.feature "OrdersControllers", type: :feature, js: true do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
    create(:service)
    login_as(user, scope: :user)
    visit root_path
  end

  context 'with guests > 0' do
    it 'generates a new order' do
      visit '/'
      find('img.category-img').click
      find('h3', text: 'La Pasionaria Cocina').find(:xpath, '..').click
      find('h4', text: 'Brunch completo').click
      click_button '+'
      click_button 'Comprar'

      # expect(page).to have_content 'Brunch completo'
      expect(page).to have_content 'Tipo de entrega'
    end
  end
end
