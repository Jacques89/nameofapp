require 'rails_helper'

describe Product do

  context "when the product has comments" do

  let(:product) { FactoryBot.create(:product) }

  let(:user) {User.create!(email: "test@test.com", password: "test123")}
  before do
  product.comments.create!(rating: 1, user: user, body: "Awful bike!")
  product.comments.create!(rating: 3, user: user, body: "Ok bike!")
  product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "is not valid without a name" do
     expect(FactoryBot.build(:product, name: "")).not_to be_valid
    end
  end
end
