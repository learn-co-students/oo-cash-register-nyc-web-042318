require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items
  attr_reader :last_transaction

  def initialize(discount = 0.0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = {}
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_transaction = {item: title, price: price, quantity: quantity}
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount > 0
      @total = @total.to_f - (@total.to_f * (@discount.to_f / 100))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction[:price] * @last_transaction[:quantity]
  end
end

