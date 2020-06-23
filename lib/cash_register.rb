require "pry"

class CashRegister
        attr_reader :discount, :quantity, :price
        attr_accessor :total, :items

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount.to_f
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @quantity = quantity
        @price = price
        self.total += (price * quantity)
        
        quantity.times do
            items << title
        end

    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = (self.total - (self.total * discount/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction       
        quantity.times do
            self.items.pop
        end

        self.total = self.total - (price * quantity)
    end




end






