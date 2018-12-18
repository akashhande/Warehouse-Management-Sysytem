require 'observer'
class OrderOut < ApplicationRecord
  include Observable

  belongs_to :product
  belongs_to :source
  belongs_to :company
  before_save :update_product  
  validates :product_id, :source_id, :product_quantity, :customer_name, :order_date, :company_id, :delivery_address, presence: true

  private
  def update_product
      add_observer(OrderOutObserver.new)
      changed
      notify_observers(self)
  end
end

