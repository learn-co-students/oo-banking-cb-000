class BankAccount
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  attr_reader :name
  attr_accessor :status, :balance
  def deposit(value_being_deposited)
    @balance += value_being_deposited
  end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end
  def close_account
    @status = "closed"
  end
end
