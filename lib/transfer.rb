class Transfer

  attr_reader :amount, :status, :receiver, :sender

  def initialize(sender, receiver, amount)
    #is fromAcct a bank_account?, then @sender = sender
    #is toAcct a bank_acct?, then @receiver = receiver

    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    if (@sender.valid? && @receiver.valid? && @amount > 0) && (@sender.balance >= @amount)
      true
    else
      false
    end
  end

  def execute_transaction
    #so we only execute once
    if valid? && @status === "pending"
      @sender.balance = @sender.balance - @amount;
      @receiver.balance = @receiver.balance + @amount;
      @status = "complete"
    elsif (@status === "pending") #@status complete leave status as is
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #assumes that valid? is true for everyone
    if @status === "complete"
      @sender.balance = @sender.balance + amount
      @receiver.balance = @receiver.balance - amount
      @status = "reversed"
    end
  end
end
