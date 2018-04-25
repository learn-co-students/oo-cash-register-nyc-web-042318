require 'pry'

class CashRegister
  attr_accessor :total, :discount, :total, :title, :price, :last_transaction

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price = price
    @quantity = quantity
    @total += price*quantity
    if quantity == 1
      @items << title
    elsif quantity >= 1
      quantity.times do
        @items << title
      end
    end
    self.last_transaction = (price * quantity)
  end

  def apply_discount
    @total = @total - @total* @discount.to_f/100.00
    if @discount != nil
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = self.total - self.last_transaction
  end

end
