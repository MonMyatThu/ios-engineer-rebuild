import UIKit

struct BankAccount {
    var owner: String
    var balance: Double
    var transactionHistory: [String] = []
    var isRich: Bool {
        balance > 10000
    }
    
    mutating func deposit(amount:Double){
        balance += amount
        transactionHistory.append("Deposited \(amount). Balance: \(balance)")
    }
    
    mutating func withdraw(amount:Double){
        if amount > balance {
           print("insufficient balance")
            return
        }
        balance -= amount
        transactionHistory.append("Withdraw \(amount). Balance: \(balance)")
    }
    
    mutating func transfer(amount:Double, to receiver: inout BankAccount) {
        balance -= amount
        receiver.balance += amount
        transactionHistory.append("Transferred \(amount) to \(receiver.owner). Balance: \(balance)")
                receiver.transactionHistory.append("Received \(amount) from \(owner). Balance: \(receiver.balance)")
    }
}

var accountOne = BankAccount(owner: "Aung", balance: 1000.0)
print(accountOne)

accountOne.deposit(amount: 500)
print(accountOne.balance)

accountOne.withdraw(amount: 200)
print(accountOne.balance)

var accountTwo = accountOne
accountTwo.deposit(amount: 1000)
print(accountOne.balance)
print(accountTwo.balance)

print(accountOne.isRich)

var account1 = BankAccount(owner: "Aung", balance: 1000)
var account2 = BankAccount(owner: "John", balance: 500)

account1.deposit(amount: 500)
account1.withdraw(amount: 200)

account1.transfer(amount: 300, to: &account2)

print(account1.balance) // 1000
print(account2.balance) // 800

print(account1.transactionHistory)
print(account2.transactionHistory)

var account3 = account1

account3.deposit(amount: 1000)

print(account1.balance) // 1000
print(account3.balance) // 2000


