class Transfer
  # your code here
  attr_accessor(:sender,:receiver,:amount,:status)
  attr_reader()

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "complete"
      #do nothing
    else
      if self.valid? && @sender.balance>=@amount
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status="complete"
      else
        @status="rejected"
        if @sender.balance < @amount
          "Transaction rejected. Please check your account balance."
        end
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status="reversed"
    else
      #do nothing

    end
  end

end
