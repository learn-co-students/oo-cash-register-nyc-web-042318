require 'pry'

class CashRegister
  attr_accessor :total, :discount, :price
  attr_reader :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @price = []
  end

  def items
    @items
  end

  def add_item(item, price, quantity=1)
    if quantity == 1
      @items << item
      @price << price
      @total += (quantity * price)
    else
      @total += (quantity * price)
      quantity.times do
        @items << item
        @price << price
      end
    end
  end

  def apply_discount
    @total -= (@total * (@discount/100.0))
    if @total > 0
      return "After the discount, the total comes to $#{total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @price[-1]
  end

end
