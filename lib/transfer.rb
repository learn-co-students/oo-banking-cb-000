class Transfer
  @@pending_status = "pending".freeze
  @@complete_status = "complete".freeze
  @@reversed_status = "reversed".freeze
  @@rejected_status = "rejected".freeze
  attr_reader :sender, :receiver, :status, :amount

  def self.initial_status
    return @@pending_status
  end

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = Transfer.initial_status
  end

  def valid?()
    return (sender.valid? && receiver.valid?)
  end

  def execute_transaction
    if (self.status != @@pending_status)
      return "Transaction rejected. It is not in #{@@pending_status} status."
    end
    if (!sender.valid? || sender.balance < amount)
      self.status = @@rejected_status
      return "Transaction rejected. Please check your account balance."
    end
    sender.balance -= amount
    receiver.balance += amount
    self.status = @@complete_status
  end

  def reverse_transfer()
    if self.status == @@complete_status
      sender.balance += amount
      receiver.balance -= amount
      self.status = @@reversed_status
    end
  end

  private
  def status=(status)
    @status = status
  end
end
