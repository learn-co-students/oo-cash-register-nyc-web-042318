require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :transaction_total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @transaction_total = 0
    if quantity > 1
      @total += (price * quantity)
      @transaction_total += (price * quantity)
      quantity.times do
        @items << title
      end
    else
      @transaction_total += price
      @total += price
      @items << title
    end
  end

  def apply_discount
    if discount > 0
      @total = (@total - @total * (@discount.to_f/100)).round
       "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transaction_total
  end

end
