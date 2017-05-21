class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  @@transactions = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? == false || @amount > @sender.balance + @receiver.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      unless @@transactions.include? self
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
        @@transactions << self
      end
    end
  end

  def reverse_transfer
    unless !@@transactions.include? self
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end

end
