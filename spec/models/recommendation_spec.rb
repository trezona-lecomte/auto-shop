require "rails_helper"

RSpec.describe Recommendation, type: :model do
  fixtures :users
  let(:recipient)   { users(:kieran) }
  let(:contributor) { users(:pragya) }
  let(:summary)     { Faker::Lorem.sentence }
  let(:content)     { Faker::Lorem.paragraphs(3) }
  let(:params) {
    {
      recipient: recipient,
      contributor: contributor,
      summary: summary,
      content: content
    }
  }

  describe "validations" do
    subject(:recommendation) { Recommendation.new(params) }

    context "without a recipient" do
      let(:recipient) { nil }

      it { is_expected.to be_invalid }
    end

    context "without a contributor" do
      let(:contributor) { nil }

      it { is_expected.to be_invalid }
    end

    context "without a summary" do
      let(:summary) { "" }

      it { is_expected.to be_invalid }
    end

    context "without content" do
      let(:content) { "" }

      it { is_expected.to be_invalid }
    end
  end
end
