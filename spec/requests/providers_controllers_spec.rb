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
end
