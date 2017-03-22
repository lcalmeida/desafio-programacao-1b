class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
    @gross_revenue = Purchase.gross_revenue_of(@purchases)
  end

  def create
    uploaded_io = params[:purchases][:file]
    Purchase.load_from!(uploaded_io)

    redirect_to purchases_path
  rescue => e
    flash.now[:error] = 'Invalid file'
    render :new
  end
end
