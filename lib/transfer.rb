class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @status = "pending"
    @amount = amount
  end

  def valid?
    return true if @sender.valid? && @receiver.valid?
    false
  end

  def execute_transaction
    return if @status == "complete"
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    @sender.deposit(0-@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  end

  def reverse_transfer
    return if @status != "complete"
    @sender.deposit(@amount)
    @receiver.deposit(0-@amount)
    @status = "reversed"
  end
end
