class BankAccount {
    static var uniqueAccountNumberCounter = 1
    
    let accountNumber: Int
    let accountOwner: String
    var balance: Double
    
    init(accountOwner: String, startingBalance: Double) {
        self.accountNumber = BankAccount.uniqueAccountNumberCounter
        BankAccount.uniqueAccountNumberCounter += 1
        self.accountOwner = accountOwner
        self.balance = startingBalance
    }
    
    func deposit(amount: Double) {
        balance += amount
        print("Deposit of \(amount) successful. New balance: \(balance)")
    }
    
    func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
            print("Withdrawal of \(amount) successful. New balance: \(balance)")
        } else {
            print("Insufficient funds. Withdrawal not allowed.")
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func displayAccountInfo() {
        print("Account Number: \(accountNumber)")
        print("Account Owner: \(accountOwner)")
        print("Current Balance: \(balance)")
    }
}

class Book {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    
    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    func displayBookInfo() {
        print("Title: \(title)")
        print("Author: \(author)")
        print("Year: \(year)")
        print("Page Count: \(pageCount)")
    }
}

class Library {
    var books: [Book] = []
    
    func addBook(book: Book) {
        books.append(book)
        print("Book added to the library.")
    }
    
    func removeBook(title: String) {
        if let index = books.firstIndex(where: { $0.title == title }) {
            books.remove(at: index)
            print("Book removed from the library.")
        } else {
            print("Book not found in the library.")
        }
    }
    
    func displayLibraryInfo() {
        print("Books in the Library:")
        for book in books {
            book.displayBookInfo()
            print("------------")
        }
    }
}
let account1 = BankAccount(accountOwner: "Damir", startingBalance: 1000.0)
account1.deposit(amount: 500.0)
account1.withdraw(amount: 200.0)
account1.displayAccountInfo()
let account2 = BankAccount(accountOwner: "Ernar", startingBalance: 500.0)
account2.deposit(amount: 1100.0)
account2.withdraw(amount: 900.0)
account2.displayAccountInfo()

let book1 = Book(title: "Path of Abai", author: "Mukhtar Auezov", year: 1942, pageCount: 1006)
let book2 = Book(title: "Richest man of babylon", author: "George Clason", year: 1926, pageCount: 144)

let library = Library()
library.addBook(book: book1)
library.addBook(book: book2)
library.displayLibraryInfo()
library.removeBook(title: "Path of Abai")
library.displayLibraryInfo()

