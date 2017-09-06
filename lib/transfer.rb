class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
      @receiver.valid? && @sender.valid?
    end

    def execute_transaction
      if valid? && sender.balance > amount && @status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        self.status = "reversed"
      else
        self.status = "rejected"
      end
    end
    

end
