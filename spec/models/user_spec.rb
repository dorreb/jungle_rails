require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    let(:user1) do
      User.create(
        first_name: "Ashley",
        last_name: "Ure",
        email: "ashley@hotmail.com",
        password: "password",
        password_confirmation: "password",
      )
    end

    let(:user2) do
      User.create(
        first_name: "Patrick",
        last_name: "Ridge",
        email: "patrick@hotmail.com",
        password: "potatoforlife",
        password_confirmation: "potatoforlife",
      )
    end

    it "is valid" do
      expect(user1).to be_valid
    end

    it "is not valid if password and password confirmation do not match" do
      user1.password_confirmation = "potato"
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include(
        "Password confirmation doesn't match Password",
      )
    end

    it "is not valid without a first name" do
      user1.first_name = nil
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      user1.last_name = nil
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without an email" do
      user1.email = nil
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid if the email is not unique" do
      user2.email = "patrick@hotmail.com"
      user1.email = "patrick@hotmail.com"
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include(
        "Email has already been taken",
      )
    end

    it "is not valid if the email is not unique, regardless of case" do
      user2.email = "patrick@hotmail.com"
      user1.email = "PATRICK@hotmail.com"
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include(
        "Email has already been taken",
      )
    end

    it "is not valid if the password length is less than 8" do
      user1.password = "potato"
      user1.password_confirmation = "potato"
      expect(user1).not_to be_valid
      expect(user1.errors.full_messages).to include(
        "Password is too short (minimum is 8 characters)",
      )
    end
  end

  describe ".authenticate_with_credentials" do
  end
end
