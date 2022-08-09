
class CashRegister
    attr_accessor :total, :last_transaction, :items, :discount

    def initialize discount=0
        @total=0
        @discount=discount
        @items=[]
    end

    def add_item title, price, quantity=1
        self.total += price*quantity
        self.last_transaction = price*quantity
        quantity.times {self.items << title}
    end

    def apply_discount
        if self.discount !=0
            self.total = (self.total*((100.0 - self.discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
        self.items.pop
    end
end
