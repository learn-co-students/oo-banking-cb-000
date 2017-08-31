class Transfer
  attr_accessor :amount, :sender, :status
  attr_reader :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @amount = 50
  end

  def valid?
    receiver.valid? && sender.valid? ? true : false
  end

  def execute_transaction
    # binding.pry
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status ? @status = 'complete' : @status = 'pending'
    
  end
end