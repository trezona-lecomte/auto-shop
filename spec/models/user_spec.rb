require 'rails_helper'

RSpec.describe User, type: :model do
  let(:provider)  { "Twitter" }
  let(:uid)       { Faker::Number.number(20) }
  let(:name)      { Faker::Name.name }
  let(:location)  { Faker::Address.city }
  let(:image_url) { Faker::Placeholdit.image("50x50") }
  let(:url)       { Faker::Internet.url }

  describe "presence validations" do
    subject { User.new(user_params) }

    context "without a name" do
      let(:name) { "" }

      it { is_expected.to be_invalid }
    end

    context "without a provider" do
      let(:provider) { "" }

      it { is_expected.to be_invalid }
    end

    context "without a uid" do
      let(:uid) { "" }

      it { is_expected.to be_invalid }
    end
  end

  def user_params
    {
      provider:  provider,
      uid:       uid,
      name:      name,
      location:  location,
      image_url: image_url,
      url:       url
    }
  end
end
