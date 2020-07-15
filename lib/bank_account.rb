class BankAccount
attr_reader :name
attr_accessor :status
attr_accessor :balance



def initialize(account)
  @name = account
  @balance = 1000
  @status = "open"
end



def deposit (num)
  @balance +=num
end

def display_balance
  return "Your balance is $#{@balance}."
end

def valid?
  if self.status == "open" && self.balance >0
    return true
  else
    return false
end

end



def close_account
  self.status = "closed"
  self.balance = 0
end



end
