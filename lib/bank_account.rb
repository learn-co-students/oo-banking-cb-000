class BankAccount
  @@initial_balance = 1000.freeze
  @@open_status = "open".freeze
  attr_reader :name
  attr_accessor :balance, :status

  def self.initial_balance()
    return @@initial_balance
  end

  def self.default_status()
    return @@open_status
  end

  def initialize(name)
    @name = name
    @balance = BankAccount.initial_balance
    @status = BankAccount.default_status
  end

  def deposit(money)
    @balance += money
  end

  def display_balance()
    return "Your balance is $#{self.balance}."
  end

  def valid?()
    return (self.status == @@open_status && self.balance > 0)
  end

  def close_account()
    self.status = "closed"
  end
end
