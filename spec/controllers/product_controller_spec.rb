require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) { FactoryBot.create(:product) }
  let(:invalid_product) { FactoryBot.create(:product) }
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }

  describe 'GET #index' do
    context 'when a user goes to index page' do
      it 'renders the index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    context 'when a user goes to a product page' do
      it 'renders the show template' do
        get :show, params: { id: product.id }
        expect(assigns(:product)).to eq product
      end
    end
  end

  describe 'GET #edit' do
    context 'when an admin goes to edit a product' do
      before do
        sign_in admin
        it 'renders the edit template' do
          get :edit, params: { id: product.id }
          expect(assigns(:product)).to eq product
          expect(response).to redirect_to('edit')
        end
      end
    end

    context 'when a non-admin user goes to edit a product' do
      before do
        sign_in user
        it 'redirect him/her to root path' do
          get :edit, params: { id: product.id }
          expect(assigns(:product)).to eq product
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end

  describe 'POST #create' do
    context 'when an admin submits a new product' do
      before do
        sign_in admin
        it 'creates a new product if valid' do
          post :create, params: { product: attributes_for(product) }
          expect(status).to be_ok
        end

        it 'rejects a new product if invalid' do
          post :create, params: { product: attributes_for(product) }
          expect(status).not_to be_ok
        end
      end
    end
  end

  describe 'PUT #update' do
    context 'when an admin submits an update to a product' do
      before do
        sign_in admin
        it 'updates product if valid' do
          put :update, params: { product: product }
          expect(status).to be_ok
          expect(response).to redirect_to('show')
        end

        it 'does not update product if invalid' do
          put :update, params: { product: invalid_product }
          expect(response).not_to be_ok
          expect(response).to redirect_to('edit')
        end
      end
    end
  end

  context 'DELETE #destroy' do
    before do
      let(:product_to_delete) { FactoryBot.create(:product) }

      it 'deletes product by id' do
        delete :destroy, params: { product: product_to_delete }
        expect(notice).to eq 'Product was successfully destroyed.'
      end
    end
  end
end 
