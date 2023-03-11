require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "saves successfully when all four fields are set" do
      category = Category.create(name: "Flowers")
      product =
        Product.new(name: "Rose", price: 10.99, quantity: 5, category: category)
      expect(product).to be_valid
      expect(product.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      category = Category.create(name: "Flowers")
      product =
        Product.new(name: nil, price: 10.99, quantity: 5, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      category = Category.create(name: "Flowers")
      product =
        Product.new(
          name: "Rose",
          price_cents: nil,
          quantity: 5,
          category: category,
        )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      category = Category.create(name: "Flowers")
      product =
        Product.new(
          name: "Rose",
          price: 10.99,
          quantity: nil,
          category: category,
        )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      product =
        Product.new(name: "Rose", price: 10.99, quantity: 5, category: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
