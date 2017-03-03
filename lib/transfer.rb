class Transfer
  attr_accessor :status
  attr_reader :receiver, :sender, :amount
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.status=="pending" && @sender.valid? && @sender.balance>@amount
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status="complete"
    else
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status=="complete"
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status="reversed"
    end
  end
end
