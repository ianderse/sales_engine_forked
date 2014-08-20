require_relative 'date_handler'

class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :repo

  def initialize(row, repo)
    @id          = row[:id]
    @name        = (row[:name]).downcase
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo        = repo
  end

  #validate data

  def items
    repo.find_items_by_merchant_id(self.id)
  end

  def invoices
    repo.find_invoices_by_merchant_id(self.id)
  end

  def favorite_customer
    # customers = invoices.map do |invoice|
    #   invoice.customer
    # end

    # customers.each do |customer|

    # end

    # customers.sort_by {|customer|customer}

  end

  def customers_with_pending_invoices
    #consider them pending if failed invoice payment?
  end

  def revenue(date=nil)
    if date.nil?
      total_revenue
    else
      revenue_on_date(date)
    end
  end

  def total_revenue
    total = 0
      invoices.each do |invoice|
        invoice.invoice_items.each do |item|
          total += item.quantity.to_i * item.unit_price.to_i
        end
      end
      total
  end

  def revenue_on_date(date)
    #refactor the shit out of this and the previous method
    invoices_on_date = []

    invoices.each do |invoice|
      if DateHandler.new(invoice.created_at).date == date || DateHandler.new(invoice.updated_at).date == date
        invoices_on_date <<invoice
      end
    end

    #puts invoices_on_date.last

    total = 0
    invoices_on_date.each do |invoice|
      invoice.invoice_items.each do |item|
            total += item.quantity.to_i * item.unit_price.to_i
          end
        end
      total
  end

end

