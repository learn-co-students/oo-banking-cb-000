class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(sum)
    self.balance += sum
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    return true if status == 'open' && balance > 0
    self.status = 'closed'
    false
  end

  def close_account
    self.status = 'closed'
  end
end
