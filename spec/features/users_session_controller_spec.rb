require 'rails_helper'

RSpec.feature "UsersSessionControllers", type: :feature do
  let!(:user) { create(:user) }

  before(:each) do
    create(:category)
  end

  context 'with valid credentials' do
    it 'redirects logged in user to categories index' do
      visit 'users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Contraseña', with: user.password
      click_button 'Registrarme'

      expect(page).to have_current_path(root_path)
    end
  end

  context 'with valid information' do
    it 'creates a new user and redirect to categories index' do
      visit 'users/sign_in'
      click_link 'No tengo cuenta'
      fill_in 'Nombre', with: "Nombre de ejemplo"
      fill_in 'Email', with: "email@email.com"
      fill_in 'Contraseña', with: "contraseña"
      click_button 'Registrarme'

      expect(page).to have_current_path(root_path)
    end
  end
end
