class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if (sender.valid? && receiver.valid?)
      if amount > sender.balance
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def execute_transaction
    if valid?
      if @status != 'complete'
        #withdrawl_amount = @amount * -1
        sender.deposit((@amount * -1))
        receiver.deposit(@amount)
        @status = 'complete'
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if @status = 'complete'
        sender.deposit(@amount)
        receiver.deposit((@amount * -1))
        @status = 'reversed'
      end
  end
end
