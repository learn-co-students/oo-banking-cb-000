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

  # can check that both accounts are valid
  # calls on the sender and reciever's #valid? methods
  def valid?
    sender.valid? && receiver.valid?
  end

  # can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender doesn't have a valid account
  def execute_transaction
  end

  # can reverse a transfer between two accounts
  # it can only reverse executed transfers
  def reverse_transfer
  end
end
