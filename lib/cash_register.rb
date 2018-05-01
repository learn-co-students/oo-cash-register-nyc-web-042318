require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :last_trans

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_trans = 0
  end

  def add_item(item, price, quantity=1)
    @last_trans = price * quantity

    @total += price * quantity

      quantity.times do
        @items << item
      end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= @total * (discount/ 100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def item
    @items
  end

  def void_last_transaction
    @total -= @last_trans
  end

end
