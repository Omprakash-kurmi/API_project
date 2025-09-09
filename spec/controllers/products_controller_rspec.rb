require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET#Index" do
    context 'write test cases of index action' do

     it '#GET index found all data'do
      product = Product.create(name: "tea", price: 102.2, stock: 2)
      expect(product['name']).to eq(product.price)
     end
    end 
  end
end