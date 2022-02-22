import 'package:flutter/material.dart';

import './helper.dart';
import '../models/transaction.dart';

class TransactionOutput extends StatelessWidget {
  final Function(String) deleteTransaction;
  const TransactionOutput(this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemExtent: 60,
          shrinkWrap: true,
          reverse: true,
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              style: ListTileStyle.drawer,
              isThreeLine: true,
              trailing: IconButton(
                color: Colors.red,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteTransaction(transactions[index].id);
                },
              ),
              leading: const Icon(
                Icons.task,
                color: Colors.green,
              ),
              title: Text(transactions[index].title),
              subtitle: Text(
                '\$${transactions[index].amount.toStringAsFixed(2)}',
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddTransactionCard extends StatelessWidget {
  final void Function(String, double) _addTransaction;
  // final VoidCallback _resetTransaction;

  const AddTransactionCard(this._addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 190,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title, color: Colors.green),
                label: Text(
                  'Title',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money_outlined, color: Colors.green),
                label: Text(
                  'Amount',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty ||
                    amountController.text.isNotEmpty ||
                    double.parse(amountController.text) > 0) {
                  _addTransaction(
                    titleController.text,
                    double.parse(amountController.text),
                  );
                  resetTransaction();
                }
              },
              child: const Text(
                'Add Expense',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoTransactionYet extends StatelessWidget {
  const NoTransactionYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'No transactions added yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.restart_alt_rounded,
                semanticLabel: 'restart',
                color: Colors.blueGrey,
              ),
            ),
            Image.asset(
              'assets/images/passion.jpg',
              width: 200,
              height: 200,
            ),
          ],
        ));
  }
}
