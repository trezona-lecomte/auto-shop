require 'rails_helper'

RSpec.describe ProductRequest, type: :model do
  subject { ProductRequest.new(product_name: name) }

  context "when no product_name is given" do
    let(:name) { "" }

    it { is_expected.to be_invalid }
  end
end
