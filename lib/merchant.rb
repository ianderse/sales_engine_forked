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
   successful_customers = []

    invoices.each do |invoice|
      invoice.transactions.each do |transaction|
        if transaction.successful_transaction?
          successful_customers << transaction.invoice.customer
        end
      end
    end
    successful_customer_sort(successful_customers)
  end

  def successful_customer_sort(successful_customers)
    customer_names = []
    successful_customers.group_by {|customer| customer.first_name}.values.max_by(&:size).first
  end

  def customers_with_pending_invoices
    #refactor this shiz
    failed_customers = []

    invoices.each do |invoice|
      invoice.transactions.each do |transaction|
        if !transaction.successful_transaction?
          failed_customers << transaction.invoice.customer
        end
      end
    end
    failed_customers
  end

  def revenue(date=nil)
    if date.nil?
      total_revenue
    else
      revenue_on_date(date)
    end
  end

  def total_revenue
    #need to check if invoice result is failed, if so do not include them in the calc.
    total = 0
      invoices.each do |invoice|
        invoice.transactions.each do |transaction|
          if transaction.successful_transaction?
            invoice.invoice_items.each do |item|
              total += item.item_revenue.to_i
            end
          end
        end
      end
      total.to_s
      #need to return as BigDecimal object
  end

  def revenue_on_date(date)
    #need to check if invoice result is failed, if so do not include them in the calc.
    #refactor the shit out of this and the previous method
    invoices_on_date = []

    invoices.each do |invoice|
      if DateHandler.new(invoice.created_at).date == date || DateHandler.new(invoice.updated_at).date == date
        invoices_on_date << invoice
      end
    end

    #puts invoices_on_date.last

    total = 0
    invoices_on_date.each do |invoice|
      invoice.transactions.each do |transaction|
          if transaction.successful_transaction?
            invoice.invoice_items.each do |item|
              total += item.item_revenue.to_i
            end
          end
        end
      end
      total.to_s
      #need to return as BigDecimal object
  end

end

