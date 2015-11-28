require "rails_helper"

RSpec.describe FindOrCreateUserFromOauth, type: :service do
  include OmniauthHelpers

  let(:service) { FindOrCreateUserFromOauth.new(auth_hash) }

  context "when successful" do
    let(:auth_hash) { mock_auth_hash }

    it "returns true" do
      expect(service.call).to be true
    end

    it "creates a new user" do
      expect { service.call }.to change { User.count }.by(1)
    end

    context "when the user doesn't yet exist" do
      let(:user) { User.last }
      let(:info) { auth_hash["info"] }
      let(:credentials) { auth_hash["credentials"] }
      let(:raw_info) { auth_hash["extra"]["raw_info"] }

      before { service.call }

      it "saves the user's details" do
        expect(user.provider)           .to eq(auth_hash["provider"])
        expect(user.uid)                .to eq(auth_hash["uid"])
        expect(user.name)               .to eq(info["name"])
        expect(user.email)              .to eq(info["email"])
        expect(user.location)           .to eq(info["location"])
        expect(user.image_url)          .to eq(info["image"])
        expect(user.url)                .to eq(info["urls"]["Twitter"])
        expect(user.token)              .to eq(credentials["token"])
        expect(user.preferred_language) .to eq(raw_info["lang"])
      end
    end

    context "when the user already exists" do
      context "when the user's attributes remain the same" do
        before do
          2.times { service.call }
        end

        it "returns the existing user instead of creating one" do
          expect(User.count).to eq(1)
        end
      end

      context "when the user's attributes change" do
        let(:new_email) { Faker::Internet.email }

        before do
          service.call
          auth_hash = mock_auth_hash(custom: { email: new_email })
          FindOrCreateUserFromOauth.new(auth_hash).call
        end

        it "updates the existing user's attributes" do
          expect(User.last.email).to eq(new_email)
        end
      end
    end

    context "when some optional data isn't present" do
      let(:auth_hash) { mock_auth_hash(custom: { email: nil }) }

      it "still creates the user" do
        expect { service.call }.to change { User.count }.by(1)
      end
    end
  end
end
