require "pry"

## NOTE: When changing an instance variable
## use self throughout the methods instead of @
## drop both self & @ when variable is not changed (ex comparisons)

class CashRegister
    attr_accessor :total, :discount, :items, :quantity, :all_transactions

    def initialize(discount = 0)
# binding.pry
        @total = 0        
        @discount = discount.to_f 

        @items = []
        @all_transactions = []
    end

    def add_item(title, price, quantity = 1)
        @quantity = quantity
        self.total += price * quantity
        quantity.times do
            items << title
        end
        self.all_transactions << price * quantity   
        
# binding.pry
    end

    def apply_discount 
# binding.pry
        if discount == 0
            "There is no discount to apply."
        else
            self.total -= (total * (discount/100))
            
            "After the discount, the total comes to $#{self.total.to_i}."
        end 
    end

    def void_last_transaction
        self.quantity.times do
            self.items.pop
        end

        self.total -= self.all_transactions.pop
    end

end




