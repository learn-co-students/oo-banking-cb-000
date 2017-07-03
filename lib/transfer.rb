class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      @receiver.valid? && @sender.valid?
    end

    def execute_transaction
      if self.valid? && sender.balance > amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.valid? && receiver.balance > amount && @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end



end
