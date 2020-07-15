class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    return @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance > @amount
      unless @status == "complete"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      reversal = Transfer.new(@receiver, @sender, @amount)
      reversal.execute_transaction
    end
  end
  
end
