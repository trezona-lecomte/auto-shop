require 'rails_helper'

RSpec.describe Offer, type: :model do
  let(:price)        { Faker::Commerce.price }
  let(:url)          { Faker::Internet.url }
  let(:product_name) { Faker::Commerce.product_name }
  let(:source_name)  { Faker::Company.name }
  let(:attrs) {
    {
      price: price,
      url: url,
      product_name: product_name,
      source_name: source_name,
      source_location: nil,
      product_description: nil,
      image_url: nil
    }
  }

  subject { Offer.new(attrs) }

  context "with no price" do
    let(:price) { "" }
    it { is_expected.to be_invalid }
  end

  context "with a non-positive price" do
    let(:price) { "0.00" }
    it { is_expected.to be_invalid }
  end

  context "with no url" do
    let(:url) { "" }
    it { is_expected.to be_invalid }
  end

  context "with no product name" do
    let(:product_name) { "" }
    it { is_expected.to be_invalid }
  end

  context "with no source name" do
    let(:source_name) { "" }
    it { is_expected.to be_invalid }
  end

  context "with a source location" do
    let(:source_location) { Faker::Address.country }
    it { is_expected.to be_valid }
  end

  context "with a product description" do
    let(:product_description) { Faker::Lorem.paragraphs(5) }
    it { is_expected.to be_valid }
  end

  context "with an image url" do
    let(:image_url) { Faker::Placeholdit.image("50x50") }
    it { is_expected.to be_valid }
  end
end
