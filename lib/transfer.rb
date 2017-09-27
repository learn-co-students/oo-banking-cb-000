class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :balance

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @balance = balance
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance >= @amount
      while @status == "pending" do
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    while @status == "complete" do
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
