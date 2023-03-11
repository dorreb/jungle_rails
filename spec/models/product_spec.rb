require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    let(:category) { Category.create(name: "Flowers") }
    let(:product) do
      Product.new(name: "Rose", price: 10.99, quantity: 5, category: category)
    end

    it "is valid with all required fields" do
      expect(product).to be_valid
      expect(product.errors.full_messages).to be_empty
    end

    context "when missing required fields" do
      it "is not valid without a name" do
        product.name = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Name can't be blank")
      end

      it "is not valid without a price" do
        product.price_cents = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Price can't be blank")
      end

      it "is not valid without a quantity" do
        product.quantity = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include(
          "Quantity can't be blank",
        )
      end

      it "is not valid without a category" do
        product.category = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include(
          "Category can't be blank",
        )
      end
    end
  end
end
