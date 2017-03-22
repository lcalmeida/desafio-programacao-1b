require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe '#index' do
    before { get :index }

    it do
      expect(assigns(:purchases)).to eq Purchase.all
      expect(assigns(:gross_revenue)).to eq 16.1
      expect(response).to render_template(:index)
    end
  end

  describe '#create' do
    let(:file) { double :file }

    context 'when its a successful upload' do
      it do
        expect(Purchase).to receive(:load_from!).with(file.to_s)
      end

      after do
        post :create, purchases: { file: file }
        expect(response).to redirect_to(:purchases)
      end
    end

    context 'when its a failure upload' do
      it do
        expect(Purchase).to receive(:load_from!).and_raise
      end

      after do
        post :create, purchases: { file: file }
        expect(response).to redirect_to(:purchases)
      end
    end
  end
end
