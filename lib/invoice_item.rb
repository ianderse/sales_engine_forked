require 'bigdecimal'

class InvoiceItem
  attr_reader :id, :quantity, :unit_price, :created_at, :updated_at, :item_id, :invoice_id, :repo

  def initialize(row, repo)
    @id          = row[:id]
    @quantity    = row[:quantity]
    @unit_price  = BigDecimal.new((row[:unit_price].to_f / 100).to_s)
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @item_id     = row[:item_id]
    @invoice_id  = row[:invoice_id]
    @repo = repo
  end

  def invoice
    repo.engine.invoice_repository.find_by_item_id(self.id)
  end

  def item
    repo.engine.item_repository.find_by_item_id(self.id)
  end
end
