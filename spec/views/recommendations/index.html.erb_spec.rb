require 'rails_helper'

RSpec.describe "recommendations/index", type: :view do
  before(:each) do
    assign(:recommendations, [
      Recommendation.create!(),
      Recommendation.create!()
    ])
  end

  it "renders a list of recommendations" do
    render
  end
end
