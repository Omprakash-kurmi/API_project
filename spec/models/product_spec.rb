require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_many(:items).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'scopes' do
    before do
      @cheap_product = Product.create!(name: "Cheap Product", price: 50, stock: 5)
      @expensive_product = Product.create!(name: "Expensive Product", price: 150, stock: 5)
      @named_product = Product.create!(name: "Special Product", price: 80, stock: 5)
    end

    describe '.cheap' do
      it 'returns products with price less than 100' do
        expect(Product.cheap).to include(@cheap_product, @named_product)
        expect(Product.cheap).not_to include(@expensive_product)
      end
    end

    describe '.by_name' do
      it 'returns products with the given name' do
        result = Product.by_name("Special Product")
        expect(result).to include(@named_product)
        expect(result).not_to include(@cheap_product)
      end
    end
  end

  describe 'dependent destroy' do
    it 'destroys associated items when the product is destroyed' do
      product = Product.create!(name: "With Items", price: 100, stock: 5)
      item = product.items.create!(name: "Item1", price: 10)
      
      expect { product.destroy }.to change { Item.count }.by(-1)
    end
  end
end
