require 'pry'
class CashRegister
    attr_accessor :total, :discount, :quantity, :item, :hash
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @hash = {}
    end

    def add_item(item, price, quantity = 1)
    if quantity == 1
        @total += (price)
            @items << item
    else
        @total += (quantity * price)
            quantity.times do
                @items << item
            end
        end
    @hash[item] = price
    @total
    #binding.pry
    end
    
    def apply_discount
        @total -= (discount * 10) if discount != nil
        @total if discount == nil
        if discount != 0
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end
    
    def items
        @items
    end
    
    def void_last_transaction
        #@total -= @hash
        price = 0
        @hash.each do |x, y|
            price = y
        end
        @total -= price
    end
    
end
