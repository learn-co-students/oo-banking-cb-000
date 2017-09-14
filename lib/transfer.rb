class Transfer
  # your code here
  attr_accessor :name
  attr_reader :sender,:receiver,:status,:amount

  # def initialize(account_a, account_b, transfer_value)
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
    # @last_transfer = {sender}
  end

  def valid?
    # sender.status == "open" && receiver.status == "open"
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # message = ""
    # puts "***************#{@sender.name}||#{@sender.status}||#{@sender.balance}||#{@sender.valid?}"
    # puts "***************#{@receiver.name}||#{@receiver.status}||#{@receiver.balance}||#{@receiver.valid?}"
    if !@sender.valid? || @amount > @sender.balance #==false
      @status="rejected"
      return "Transaction rejected. Please check your account balance."
    end #sendr.valid?

    if  @status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status="complete"
    end # @status == pending
  end

  def reverse_transfer
    if @status == "complete"
      # @reciever.balance -= @amount
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status="reversed"
    end
  end
end #end class
