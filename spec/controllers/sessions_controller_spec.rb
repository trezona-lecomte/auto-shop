require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  describe "POST create" do
    context "when the user has never authenticated before" do
      it "creates a new user" do
        expect { post :create, provider: :twitter }
          .to change { User.count }.by(1)
      end

      it "initializes the session for the new user" do
        expect(session[:user_id]).to be_nil

        post :create, provider: :twitter
        expect(session[:user_id]).to eq(User.last.id)
      end

      it "redirects to the root url" do
        post :create, provider: :twitter
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the user's session" do
      post :create, provider: :twitter
      expect(session[:user_id]).to eq(User.last.id)

      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
