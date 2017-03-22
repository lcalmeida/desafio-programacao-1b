class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
    @gross_revenue = Purchase.gross_revenue_of(@purchases)
  end

  def create
    uploaded_io = params[:purchases][:file]
    binding.pry
    puts uploaded_io.read
    redirect_to purchases_path
  end
end
