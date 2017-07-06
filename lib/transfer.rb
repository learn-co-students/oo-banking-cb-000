class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if @sender.valid? and @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == 'pending' and valid? and @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = 'reversed'
    end

  end
end
