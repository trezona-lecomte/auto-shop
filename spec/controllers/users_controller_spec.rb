require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { users(:kieran) }
  let(:current_user) { user }

  describe "GET show" do
    subject { response }

    before do
      allow(controller).to receive(:current_user).and_return(current_user)
      get :show, id: user.id
    end

    context "when the user is authorized" do
      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template(:show) }
    end

    context "when the user is not authenticated" do
      let(:current_user) { nil }

      it { is_expected.to redirect_to("/") }
    end

    context "when the user is not authorized" do
      let(:current_user) { users(:pragya) }

      it { is_expected.to redirect_to("/") }
    end
  end
end
