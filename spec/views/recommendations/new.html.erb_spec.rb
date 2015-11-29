require 'rails_helper'

RSpec.describe "recommendations/new", type: :view do
  before(:each) do
    assign(:recommendation, Recommendation.new())
  end

  it "renders new recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendations_path, "post" do
    end
  end
end
