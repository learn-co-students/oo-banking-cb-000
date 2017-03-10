class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize sender, receiver, amount
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance - amount > 0
      if status != 'complete'
        sender.deposit(amount * -1)
        receiver.deposit(amount * 1)
        @status = 'complete'
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == 'complete'
      sender.deposit(amount * 1)
      receiver.deposit(amount * -1)
      @status = 'reversed'
    end
  end
end
