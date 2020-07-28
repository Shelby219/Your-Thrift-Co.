require 'rails_helper'

RSpec.describe "shopping_bags/index", type: :view do
  before(:each) do
    assign(:shopping_bags, [
      ShoppingBag.create!(),
      ShoppingBag.create!()
    ])
  end

  it "renders a list of shopping_bags" do
    render
  end
end
