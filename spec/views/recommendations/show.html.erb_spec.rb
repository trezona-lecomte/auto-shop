require 'rails_helper'

RSpec.describe "recommendations/show", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
