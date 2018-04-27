require "pry"

class CashRegister
attr_accessor :total, :discount, :quantity, :last_transaction



def initialize(discount=0)
  @discount = discount
  @total = 0
  @items = []
end

def total
  @total
end

def add_item(title, price, quantity=1)
  self.total += price * quantity
  quantity.times do
    @items << title
  end
  @last_transaction = price * quantity
end

def apply_discount
  if @discount > 0
    @total *= ((100 - @discount.to_f)/100)
    "After the discount, the total comes to $#{@total.to_i}."
  else
    "There is no discount to apply."
  end
end

def items
  @items
end

def void_last_transaction
  @total = @total - @last_transaction
end

end
