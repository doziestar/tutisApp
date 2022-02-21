import 'package:flutter/material.dart';

import '../sec2/models/transactions.dart';
import '../sec2/widgets/transaction_list.dart';

class ReceiveInput extends StatefulWidget {
  final VoidCallback _addTransaction;

  const ReceiveInput(this._addTransaction);

  @override
  State<ReceiveInput> createState() => _ReceiveInputState();
}

class _ReceiveInputState extends State<ReceiveInput> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: titleController,
              onSubmitted: (_) => widget._addTransaction(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              controller: amountController,
              onSubmitted: (_) => widget._addTransaction(),
            ),
            TextButton(
              onPressed: () {
                widget._addTransaction();
              },
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final amountController = TextEditingController();
final titleController = TextEditingController();
// late String titleInput;
// late String amountInput;

class TransactionWid extends StatefulWidget {
  const TransactionWid({Key? key}) : super(key: key);

  @override
  State<TransactionWid> createState() => _TransactionWidState();
}

class _TransactionWidState extends State<TransactionWid> {
  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    // transactions.add(newTransaction);
    setState(() {
      transactions.add(newTransaction);
    });
  }

  void _submitData() {
    if (amountController.text.isEmpty ||
        titleController.text.isEmpty ||
        double.parse(amountController.text) < 0) {
      return;
    }
    _addTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReceiveInput(
          _submitData,
        ),
        TransactionScroll(_deleteTransaction),
      ],
    );
  }
}
