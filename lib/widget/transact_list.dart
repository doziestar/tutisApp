import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './helper.dart';
import '../models/transaction.dart';

class TransactionOutput extends StatelessWidget {
  final Function(String) deleteTransaction;
  const TransactionOutput(this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: ListView.builder(
        itemExtent: 60,
        shrinkWrap: true,
        reverse: true,
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            child: ListTile(
              trailing: IconButton(
                color: Colors.red,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteTransaction(transactions[index].id);
                },
              ),
              leading: CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(0)}',
                    ),
                  ),
                ),
              ),
              title: Text(transactions[index].title),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddTransactionCard extends StatelessWidget {
  final void Function(String, double, DateTime) _addTransaction;
  // final VoidCallback _resetTransaction;

  const AddTransactionCard(this._addTransaction);

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        // setState(() {
        //   dateController = pickedDate;
        //   // print(pickedDate);
        // });
        dateController = pickedDate;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        // height: 190,
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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.date_range, color: Colors.green),
                  Text(
                    dateController == null
                        ? 'No Date selected! '
                        : DateFormat().add_yMd().format(dateController),
                    style: const TextStyle(color: Colors.red),
                  ),
                  TextButton(
                    onPressed: () => _presentDatePicker(context),
                    child: const Text('Add Date',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty ||
                      amountController.text.isNotEmpty ||
                      double.parse(amountController.text) > 0) {
                    _addTransaction(
                      titleController.text,
                      double.parse(amountController.text),
                      dateController,
                    );
                    resetTransaction();
                  }
                },
                child: const Text(
                  'Add Expense',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
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
