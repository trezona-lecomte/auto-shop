require "rails_helper"

RSpec.describe ProductRequestsController, type: :controller do
  let(:product_request) {
    ProductRequest.create!(product_name: Faker::Commerce.product_name)
  }

  let(:valid_params) {
    { product_request: { product_name: product_request.product_name } }
  }

  subject { response }

  describe "GET show" do
    before { get :show, id: product_request.id }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:show) }
    it { is_expected.to render_template(partial: "offer") }
  end

  describe "GET new" do
    before { get :new }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:new) }
  end

  describe "POST create" do
    before { post :create, valid_params }

    it { is_expected.to have_http_status(:created) }
    it { is_expected.to render_template(:show) }
  end
end
