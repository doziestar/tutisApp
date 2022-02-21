class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}

final List<Transaction> transactions = [
  Transaction(
    id: 't1',
    title: 'New Shoes',
    amount: 69.99,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't2',
    title: 'Weekly Groceries',
    amount: 56.54,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't3',
    title: 'Monthly Expenses',
    amount: 12.00,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't1',
    title: 'New Shoes',
    amount: 69.99,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't2',
    title: 'Weekly Groceries',
    amount: 56.54,
    date: DateTime.now(),
  ),
  Transaction(
    id: 't3',
    title: 'Monthly Expenses',
    amount: 12.00,
    date: DateTime.now(),
  ),
];
