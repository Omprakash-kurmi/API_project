require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:data) { JSON.parse(response.body) }
  describe "GET#Index" do
    let(:product){ FactoryBot.create(:product) }
    context 'write test cases of index action' do

     it '#GET index found all data'do
      expect(product['name']).to eq(product.name)
     end
    end 
  end

  describe "Post#Create" do 
    let(:category1) { FactoryBot.create(:category) }
    context 'create product ' do
      it 'product successful created' do
        post :create, params: { product:{name: "tea", description: "best tea", stock: 22,
         price:23.2, category_id: category1.id }}
        expect(data['data']['description']).to eq("best tea")
      end

      it 'product not created' do
        post :create, params: { product:{name: "tea", description: "best tea", stock: 22,
         price:23.2, category_id: nil }}
        expect(data['errors']['category'][0]).to eq("must exist")
      end
    end
  end
  
  describe "PUT#update" do 
      let(:category1) { FactoryBot.create(:category) }
      let(:product) { FactoryBot.create(:product) }
      context 'create product ' do
        it 'product successful created' do
          put :update, params: { id: product.id, product:{ name: "coffe"}}
          expect(data['data']['name']).to eq("coffe")
        end

        it 'product not found ' do
          put :update, params: { id: 0 }
          expect(data['errors']).to eq("Product not found")
        end
      end
    end

  describe "GET#Create" do 
    let(:category1) { FactoryBot.create(:category) }
    let(:product) { FactoryBot.create(:product) }

    context 'show product ' do
      it 'find data successful' do
        get :show, params: { id: product.id }
        expect(data['data']['description']).to eq("this is best product in my company")
      end

      it 'data not found' do
        get :show, params: { id: 0 }
        expect(data['errors']).to eq("Product not found")
      end
    end
  end
end