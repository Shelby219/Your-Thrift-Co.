require 'rails_helper'

RSpec.describe "shopping_bags/new", type: :view do
  before(:each) do
    assign(:shopping_bag, ShoppingBag.new())
  end

  it "renders new shopping_bag form" do
    render

    assert_select "form[action=?][method=?]", shopping_bags_path, "post" do
    end
  end
end
