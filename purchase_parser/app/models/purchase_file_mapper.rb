class PurchaseFileMapper
  MODEL = Purchase

  MAP = {
    customer: 'comprador',
    description: 'descrição',
    unit_price: 'preço uniário',
    amount: 'quantidade',
    address: 'endereço',
    provider: 'fornecedor'
  }.freeze

  def self.remap(keys)
    keys.map do |key|
      MAP.invert[key.downcase.chomp]
    end
  end
end
