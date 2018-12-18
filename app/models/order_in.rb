require 'observer'
class OrderIn < ApplicationRecord
  include Observable
  
  belongs_to :product
  belongs_to :source
  belongs_to :company

  after_save :update_product  
  validates :product_id, :source_id, :product_quantity, :purchase_price , :sale_price,:company_id, presence: true

  private
  def update_product
      add_observer(ProductObserver.new)
      changed
      notify_observers(self)
  end
end
