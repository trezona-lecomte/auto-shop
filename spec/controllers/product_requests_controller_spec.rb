require 'rails_helper'

RSpec.describe ProductRequestsController, type: :controller do
  let(:valid_params) { { product_request: product_request } }
  let(:product_request) { { product_name: Faker::Commerce.product_name } }

  describe "GET new" do
    subject { response }

    before { get :new }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:new) }
  end

  describe "#create" do
    subject { response }

    before { post :create, valid_params }

    it { is_expected.to have_http_status(:created) }
    it { is_expected.to render_template(:show) }
  end
end
