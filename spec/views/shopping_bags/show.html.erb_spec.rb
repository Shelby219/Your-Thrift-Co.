require 'rails_helper'

RSpec.describe "shopping_bags/show", type: :view do
  before(:each) do
    @shopping_bag = assign(:shopping_bag, ShoppingBag.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
