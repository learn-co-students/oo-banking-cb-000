class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && !@sender.transfers.include?(self) && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @sender.transfers << self
      @status = 'complete'
    elsif @sender.balance < @amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @sender.transfers.include?(self) && @receiver.balance >= @amount
       @sender.balance += @amount
       @receiver.balance -= @amount
       @sender.transfers.delete(self)
       @status = 'reversed'
     elsif @receiver.balance < @amount
       @status = 'rejected'
       "Transaction rejected. Please check your account balance."
     end
  end

end
