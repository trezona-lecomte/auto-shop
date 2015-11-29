require 'rails_helper'

RSpec.describe "recommendations/edit", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!())
  end

  it "renders the edit recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendation_path(@recommendation), "post" do
    end
  end
end
