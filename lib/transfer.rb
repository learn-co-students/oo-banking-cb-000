class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :amount_for_reverse

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @amount_for_reverse = 0
  end

  def valid?
    @sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    execute_only_once = true
    if @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @amount_for_reverse += @amount
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    @sender.balance += @amount_for_reverse
    @receiver.balance -= @amount_for_reverse
    @status = "reversed"
  end


end
