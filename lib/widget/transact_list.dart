import 'package:flutter/material.dart';

final titleInput = TextEditingController();
final amountInput = TextEditingController();
final dateInput = TextEditingController();

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

class NewTransaction extends StatelessWidget {
  const NewTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            controller: titleInput,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.title, color: Colors.green),
              labelText: 'Title',
              labelStyle: TextStyle(color: Colors.green),
            ),
          ),
          TextField(
            controller: amountInput,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.attach_money, color: Colors.green),
              labelText: 'Amount',
              labelStyle: TextStyle(color: Colors.green),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          TextButton(
            child: const Text(
              'Add Transaction',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              print('Add transaction button pressed');
            },
          ),
        ],
      ),
    );
  }
}
