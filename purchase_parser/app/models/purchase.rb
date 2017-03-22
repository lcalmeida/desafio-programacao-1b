class Purchase < ActiveRecord::Base
  def self.gross_revenue_of(purchases)
    purchases.inject(0) do |sum, purchase|
      sum + purchase.amount * purchase.unit_price
    end
  end
end
