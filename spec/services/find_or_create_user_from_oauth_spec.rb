require "rails_helper"

RSpec.describe FindOrCreateUserFromOauth, type: :service do
  include OmniauthHelpers

  let(:service) { FindOrCreateUserFromOauth.new(auth_hash) }

  context "when successful" do
    let(:auth_hash) { twitter_auth_hash }

    it "returns true" do
      expect(service.call).to be true
    end

    context "when the user doesn't yet exist" do
      it "creates a new user" do
        expect { service.call }.to change { User.count }.by(1)
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
          auth_hash = twitter_auth_hash(custom: { email: new_email })
          FindOrCreateUserFromOauth.new(auth_hash).call
        end

        it "updates the existing user's attributes" do
          expect(User.last.email).to eq(new_email)
        end
      end
    end

    context "when some optional data isn't present" do
      let(:auth_hash) { twitter_auth_hash(custom: { email: nil }) }

      it "still creates the user" do
        expect { service.call }.to change { User.count }.by(1)
      end
    end
  end
end
