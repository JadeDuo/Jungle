require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates the product with all four values and saves' do
      @category = Category.new(name: "Fruit Tree")
      
      @testproduct = Product.new(name: "Apple seedling", price_cents: 5000, quantity: 1, category: @category)
      
      @testproduct.save

      expect(@testproduct).to be_valid
    end
    it 'validates name of product is required' do
      @category = Category.new(name: "Fruit Tree")

      @testproduct = Product.new(name: nil, price_cents: 5000, quantity: 1, category: @category)

      expect(@testproduct).not_to be_valid
    end
    it 'validates price of product is required' do
      @category = Category.new(name: "Fruit Tree")

      @testproduct = Product.new(name: "Apple seedling", price_cents: nil, quantity: 1, category: @category)

      expect(@testproduct).not_to be_valid
    end
    it 'validates quantity of product is required' do
      @category = Category.new(name: "Fruit Tree")

      @testproduct = Product.new(name: "Apple seedling", price_cents: 5000, quantity: nil, category: @category)

      expect(@testproduct).not_to be_valid
    end
    it 'validates that the category of product is required' do
      @category = Category.new(name: "Fruit Tree")

      @testproduct = Product.new(name: "Apple seedling", price_cents: 5000, quantity: 1, category: nil)

      expect(@testproduct).not_to be_valid
    end
  end
end
