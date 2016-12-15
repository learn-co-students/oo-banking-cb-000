class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && @status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      rejected
    end
  end

  def reverse_transfer
    if @status == "complete" && valid? && receiver.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
      rejected
    end
  end

  def rejected
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end

# learn ./spec/transfer_spec.rb
