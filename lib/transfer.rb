class Transfer
  # your code here
  attr_reader :sender
  attr_accessor :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount, @status = sender, receiver, amount, 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? && @status == 'pending' && @sender.balance > @amount
  end

  def execute_transaction
    if valid?
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = 'reversed'
    end
  end
end
