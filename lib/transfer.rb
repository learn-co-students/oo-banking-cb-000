class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    #if valid?
    #  execute_transaction(sender, receiver, amount)
    #end
  end

  def valid?
    (@sender.valid?) && (@receiver.valid?) ? true : false
  end

  def execute_transaction
    if valid? && status == "pending"
      if (@sender.balance < @amount)
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        @sender.withdrawal(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdrawal(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
