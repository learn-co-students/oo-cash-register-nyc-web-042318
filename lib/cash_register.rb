require 'pry'

class CashRegister
  attr_accessor :total, :transaction
  attr_reader :items, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.transaction = []
    self.total += price*quantity
    quantity.times do
      self.items << title
    end
    self.transaction << title
    self.transaction << price
    self.transaction << quantity
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      discount_percent = self.discount/100.0
      multiplier = 1.0 - discount_percent
      self.total = self.total*multiplier
      if Float(self.total) == self.total
        self.total = Integer(total)
      end
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    num_times = self.transaction[2]
    num_times.times do
      self.items.delete(self.transaction[0])
      self.total -= self.transaction[1]
    end
  end
end
