class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  # can initialize a Transfer
  # initializes with a sender
  # initializes with a receiver
  # always initializes with a status of 'pending'
  # initializes with a transfer amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount 
  end
end
