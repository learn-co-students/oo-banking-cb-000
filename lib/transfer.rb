class Transfer
  attr_reader :sender, :receiver, :status, :amount

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
    if !valid? || @sender.balance < amount || @status == "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
    end
  end
end
