require 'rails_helper'

RSpec.describe ProductRequestsController, type: :controller do
  describe "GET new" do
    subject { response }

    before { get :new }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:new) }
  end
end
