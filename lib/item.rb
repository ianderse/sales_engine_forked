require 'bigdecimal'  # => true
require_relative 'date_handler'

class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :repo  # => nil

  def initialize(row, repo)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new((row[:unit_price].to_f / 100).to_s)
    @merchant_id = row[:merchant_id]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo = repo
  end

  #validate data

  def invoice_items
    repo.find_invoice_items_by_item_id(self.id)
  end

  def merchant
    repo.find_merchant_by_merchant_id(self.merchant_id)
  end

  def best_day
    invoices = invoice_items.select {|invoice_item| invoice_item.invoice}

    best_invoice = invoices.max_by do |invoice|
      invoices.each do |i|
        if invoice.id == i.id
          invoice.item_revenue + i.item_revenue
        else
          invoice.item_revenue
        end
      end
    end
    DateHandler.new(best_invoice.created_at).date
  end
end
