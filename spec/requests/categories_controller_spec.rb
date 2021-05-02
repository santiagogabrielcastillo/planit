require 'rails_helper'

RSpec.describe "CategoriesControllers", type: :request do
  let!(:user) { create(:user) }

  before(:each) do
    create(:provider_with_categories)
  end

  describe "GET /index" do
    context 'when user not logged in' do
      it 'is able to see index page' do
        get root_path

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /show' do
    context 'when user not logged in' do
      it 'is able to see the show page' do
        get category_path(Category.first)

        expect(response).to have_http_status(:success)
      end
    end
  end
end
