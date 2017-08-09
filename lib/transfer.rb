# a simple Transfer representation
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @last_transaction = self
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? && @status == 'pending' && @sender.balance >= @amount
  end

  def execute_transaction
    if valid?
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    @status == 'complete' || return
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = 'reversed'
  end
end
