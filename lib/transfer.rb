class Transfer

    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end

    def valid?
        @sender.valid? && @receiver.valid?
    end

    def execute_transaction
        if @sender.valid? == false || amount > @sender.balance
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
        elsif status == "pending"
            @sender.deposit(-amount)
            @receiver.deposit(amount)
            @status = "complete"
        end
    end

    def reverse_transfer
        if status == "complete"
            @sender.deposit(amount)
            @receiver.deposit(-amount)
            @status = "reversed"
        end
    end

end
