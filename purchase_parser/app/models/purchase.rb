class Purchase < ActiveRecord::Base
  def self.gross_revenue_of(purchases)
    purchases.inject(0) do |sum, purchase|
      sum + purchase.amount * purchase.unit_price
    end
  end

  def self.load_from!(uploaded_io)
    parser = Parser.new(PurchaseFileMapper)
    purchases = parser.parse(uploaded_io)

    Purchase.transaction do
      purchases.each(&:save!)
    end
  end
end
