class Transfer

  attr_accessor :transfer, :sender, :receiver, :amount, :status
  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
    end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @sender.balance > @amount #needed to take into account the balance amount, valid? does not
      while @status == "pending"
        @receiver.balance = @receiver.balance + @amount
        @sender.balance = @sender.balance - @amount
        @status = "complete"
       end
    else
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end

  end

  def reverse_transfer

    if valid? && self.status == "complete" && @receiver.balance > @amount
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      @status = "rejected"

       "Transaction rejected. Please check your account balance."
      end


  end



end
