require 'csv'


class SalesEngine

  attr_reader :merchant_repository, :invoice_repository, :item_repository
              :invoice_item_repository, :customer_repository, :transaction_repository
  def initialize

  end

  def startup
    @merchant_repository = MerchantRepository.new
    @invoice_repository  = InvoiceRepository.new
    @item_repository     = ItemRepository.new
    @invoice_item_repository = InvoiceItemRepository.new
    @customer_repository = CustomerRepository.new
    @transaction_repository = TransactionRepository.new
  end


end




engine = SalesEngine.new
engine.startup

engine.merchant_repository
engine.invoice_repository
engine.item_repository
engine.invoice_item_repository
engine.customer_repository
engine.transaction_repository
