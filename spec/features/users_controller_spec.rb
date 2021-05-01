require 'rails_helper'

RSpec.feature "UserControllers", type: :feature, js: true do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
    login_as(user, scope: :user)
    visit root_path
  end

  describe 'Edit user information' do
    before(:each) do
      click_on 'dropdownMenuButton'
      click_on 'Ver perfil'
      find('i.fas', match: :first).click
    end

    context 'when giving valid data' do
      it 'the user can edit his personal information' do
        fill_in 'Teléfono', with: '1520586397'
        click_on 'Editar'

        expect(page).to have_current_path(user_path(User.last))
      end
    end

    context 'when leaving an empty field' do
      it 'shows an error message' do
        fill_in 'Nombre', with: ''
        click_on 'Editar'

        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
