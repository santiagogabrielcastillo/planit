require 'rails_helper'

RSpec.describe "ProvidersControllers", type: :request do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
  end

  describe "GET /providers/:id" do
    context 'when user not logged in' do
      it 'redirects to sign in page' do
        get provider_path(Provider.last)

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is logged in' do
      it 'is able to see the show page' do
        login_as(user, scope: :user)
        get provider_path(Provider.last)

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /providers/new' do
    context 'if user is not an admin' do
      it 'shows an error message' do
        login_as(user, scope: :user)
        get new_provider_path

        expect(response.body).to include('No tenés permitido crear proveedores!')
      end
    end

    context 'if user is an admin' do
      it 'is able to create a new provider' do
        login_as(create(:user, admin: true), scope: :user)
        get new_provider_path

        expect(response.body).to include('Crear nuevo proveedor')
      end
    end
  end

  describe 'POST /providers' do
    context 'when user is admin and gives valid information' do
      it 'creates a new provider' do
        login_as(create(:user, admin: true), scope: :user)
        get new_provider_path
        provider_params = {
          provider: {
            name: Provider.last.name,
            address: Provider.last.address,
            description: Provider.last.description,
            category_ids: Category.last.id,
            schedule: Provider.last.schedule
          }
        }
        post providers_path, params: provider_params

        expect(response).to redirect_to(provider_path(Provider.last))
      end
    end
  end
end
