require 'rails_helper'

RSpec.feature "UsersSessionControllers", type: :feature, js: true do
  let!(:user) { create(:user) }

  before(:each) do
    create(:category)
  end

  describe 'sign in' do
    context 'with valid credentials' do
      it 'redirects logged in user to categories index' do
        visit 'users/sign_in'
        fill_in 'Email', with: user.email
        fill_in 'Contraseña', with: user.password
        click_button 'Registrarme'

        expect(page).to have_current_path(root_path)
      end
    end

    context 'with invalid credentials' do
      it 'shows an invalid information message and stays in the log in page' do
        visit 'users/sign_in'
        fill_in 'Email', with: user.email
        fill_in 'Contraseña', with: 'contraseña'
        click_button 'Registrarme'

        expect(page).to have_content("Invalid Email or password")
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  describe 'sign up' do
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
end
