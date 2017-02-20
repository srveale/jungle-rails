require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product1 = cat1.products.new(name: 'one', price: 2010, quantity: 20)
      expect(product1).to be_valid
    end

    it "is not valid without a name" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product2 = cat1.products.new(name: nil, price: 2010, quantity: 20)
      expect(product2).to_not be_valid
    end

    it "is not valid without a price" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product3 = cat1.products.new(name: 'three', price: nil, quantity: 20)
      expect(product3).to_not be_valid
    end

    it "is not valid without a quantity" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product4 = cat1.products.new(name: 'four', price: 2010, quantity: nil)
      expect(product4).to_not be_valid
    end

    it "is not valid without a category" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product5 = Product.new(name: 'five', price: 2010, quantity: 20, category_id: nil)
      expect(product5).to_not be_valid
    end

  end
end