require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:purchases) { Purchase.all }

  describe '.gross_revenue_of' do
    it { expect(Purchase.gross_revenue_of(purchases)).to eq 16.1 }
  end

  describe '.load_from!' do
    let(:upload_io) { double :upload_io }

    before do
      expect_any_instance_of(Parser).to receive(:parse).with(upload_io).and_return(purchases)
    end

    after { Purchase.load_from!(upload_io) }

    it { expect(purchases).to all(receive(:save!)) }
  end
end
