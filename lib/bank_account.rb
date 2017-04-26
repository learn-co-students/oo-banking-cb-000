class BankAccount
  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize (name)
    @status = "open"
    @name = name
    @balance = 1000
  end

  def deposit(amount)
    @balance = 1000 + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end


end
