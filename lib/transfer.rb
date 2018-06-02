require 'pry'

class Transfer
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending"
      if valid? == false || @sender.balance - @amount < 0
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
      @sender.balance -= amount
      @receiver.deposit(amount)
      @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.balance -= amount
      @status = "reversed"
    end

  end

end

# class BankAccount
#   attr_accessor :balance, :status
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#     @balance = 1000
#     @status = "open"
#   end
#
#   def deposit(amount)
#     @balance += amount
#   end
#
#   def display_balance
#     "Your balance is $#{@balance}."
#   end
#
#   def valid?
#     if @status == "open" && @balance > 0
#       true
#     else
#       false
#     end
#   end
#
#   def close_account
#     @status = "closed"
#   end
#
# end
#
# broke_boi = BankAccount.new("Broke Boi")
# gertrude = BankAccount.new("Gertrude")
# transfer = Transfer.new(broke_boi, gertrude, 5000)
# transfer.execute_transaction
# transfer2 = Transfer.new(broke_boi, gertrude, 5000)
# transfer2.execute_transaction
# transfer2.status
#
# broke_boi.balance
#
# sender = transfer.sender
# receiver = transfer.receiver
#
# sender.balance -= 50
#
#
# amount = 100
# sender.balance -= amount
# receiver.deposit(amount)
