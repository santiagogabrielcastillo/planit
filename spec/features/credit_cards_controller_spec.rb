require 'rails_helper'

RSpec.feature 'credit_cards', type: :feature do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
    login_as(user, scope: :user)
    visit root_path
    click_on 'dropdownMenuButton'
    click_on 'Ver perfil'
  end

  describe 'New credit card process' do
    before(:each) do
      find('h5', text: 'Medios de pago guardados:').find('+a').click
    end

    context 'when giving valid information' do
      it 'creates a new credit card and redirect to the user information page' do
        fill_in 'Número de tarjeta', with: '2525-1010-8585-9999'
        fill_in 'Nombre del titular', with: User.last.name
        fill_in 'Mes y año de vencimiento', with: '05/21'
        click_on 'Guardar'

        expect(page).to have_content('2525-1010-8585-9999')
        expect(page).to have_current_path(user_path(User.last))
      end
    end

    context 'when leaving an empty field' do
      it 'shows an error message' do
        fill_in 'Número de tarjeta', with: '2525-1010-8585-9999'
        fill_in 'Nombre del titular', with: ''
        fill_in 'Mes y año de vencimiento', with: '05/21'
        click_on 'Guardar'

        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
