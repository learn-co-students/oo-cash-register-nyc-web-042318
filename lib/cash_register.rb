class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_trans = 0
  end

  def add_item(title, price, quantity=1)
    @total += price*quantity
    quantity.times do
      @items << title
    end
    @last_trans = price*quantity
  end

  def apply_discount
    @total -= @total * (discount/100.0)
    if discount == 0
      return "There is no discount to apply."
    end
    return "After the discount, the total comes to $#{@total.to_i}."
  end
  # def self.discount
  #   20
  # end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_trans
  end

end
