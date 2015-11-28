require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  let(:call_result) { true }
  let(:service) {
    instance_double(
      "FindOrCreateUserFromOauth",
      call: call_result,
      user: instance_double("User", id: 42, name: "foo_bar"),
      errors: double(messages: %w(foo bar baz))
    )
  }

  before do
    allow(FindOrCreateUserFromOauth).to receive(:new).and_return(service)
    allow(controller).to receive(:current_user).and_return(double("User"))
  end

  describe "POST create" do
    context "before a user has signed in" do
      it "has no id in the session" do
        expect(session[:user_id]).to be_nil
      end
    end

    context "when successful" do
      before { post :create, provider: :twitter }

      it "initializes the session for the new user" do
        expect(session[:user_id]).to eq(service.user.id)
      end

      it "redirects to the root url" do
        expect(response).to redirect_to root_url
      end

      it "sets the current user" do
        expect(controller.current_user).to be_present
      end
    end

    context "when unsuccessful" do
      let(:call_result) { false }

      before { post :create, provider: :twitter }

      it "returns errors in the flash" do
        expect(flash[:warning]).to be_present
      end
    end
  end

  describe "DELETE destroy" do
    before { post :create, provider: :twitter }

    it "destroys the user's session" do
      expect { delete :destroy }
        .to change { session[:user_id] }.from(42).to(nil)
    end
  end
end
