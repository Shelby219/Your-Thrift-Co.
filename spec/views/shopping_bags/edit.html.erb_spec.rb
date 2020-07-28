require 'rails_helper'

RSpec.describe "shopping_bags/edit", type: :view do
  before(:each) do
    @shopping_bag = assign(:shopping_bag, ShoppingBag.create!())
  end

  it "renders the edit shopping_bag form" do
    render

    assert_select "form[action=?][method=?]", shopping_bag_path(@shopping_bag), "post" do
    end
  end
end
