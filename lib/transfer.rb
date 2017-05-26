class Transfer
  # your code here
    attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @executed = false
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !@executed
      if @sender.balance < @amount
        @status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end
      @sender.balance -= @amount
      @receiver.balance += @amount
      @executed = true
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @executed

      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = 'reversed'
    end
  end

end
