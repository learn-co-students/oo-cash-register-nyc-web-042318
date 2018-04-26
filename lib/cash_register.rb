require 'pry'

class CashRegister
  attr_accessor :total, :discount
  attr_reader :title, :price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity=1)
    if @price == nil
      @price = []
    end
    quantity.times do
      @price << price
    end


    if @title == nil
      @title = []
    end
    quantity.times do
      @title << title
    end

    @total += (price * quantity)
  end

  def apply_discount
    if discount == nil
      "There is no discount to apply."
    else
      @total = @total.to_f * ((100.to_f - @discount.to_f)/100.to_f)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @title
  end

  def void_last_transaction
    @total = @total.to_f - (@price.last).to_f
    @total
  end


end
