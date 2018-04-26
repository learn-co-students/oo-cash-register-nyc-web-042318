require 'pry'
class CashRegister

attr_accessor :total, :discount, :cart, :price

  def initialize(discount = 0)
    @cart = []
    @total = 0
    @discount = discount
    @price = []
  end




  def add_item(title, price, quantity=1)
      quantity.times do
      @cart << title
      @price << price
    end

    @total += price * quantity

  end




  def apply_discount

    #because discount is a float, must divide by 100.0 as opposed to 100
      @total -= (@total * (@discount/100.0))
      if @discount != 0
      return "After the discount, the total comes to $#{@total.to_i}."

      else

      return "There is no discount to apply."
      end

  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @price.last
  end

end
