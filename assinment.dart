abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * (interestRate / 100);
    } else {
      print("Insufficient funds");
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

void main() {
  // Create a SavingsAccount instance
  var savings = SavingsAccount(1, 1000, 5);
  print("Savings Account Initial Balance: ${savings.balance}");
  savings.deposit(500);
  print("After Deposit: ${savings.balance}");
  savings.withdraw(300);
  print("After Withdrawal with Interest: ${savings.balance}");

  // Create a CurrentAccount instance
  var current = CurrentAccount(2, 2000, 1000);
  print("Current Account Initial Balance: ${current.balance}");
  current.deposit(700);
  print("After Deposit: ${current.balance}");
  current.withdraw(300);
  print("After Withdrawal: ${current.balance}");
  current.withdraw(3000);
  print("After Large Withdrawal: ${current.balance}");
}
