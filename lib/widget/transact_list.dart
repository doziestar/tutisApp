import 'package:flutter/material.dart';
import 'package:tutis/models/transaction.dart';

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
      child: transactions.isNotEmpty
          ? _buildTransactionList()
          : _buildNoTransactions(),
    );
  }
}

Widget _buildTransactionList() {
  // return ListView.builder(
  //   itemBuilder: (context, index) {
  //     final transaction = transactions[index];
  //     return Card(
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             margin: const EdgeInsets.symmetric(
  //               vertical: 10,
  //               horizontal: 15,
  //             ),
  //             decoration: BoxDecoration(
  //               border: Border.all(
  //                 color: Colors.purple,
  //                 width: 2,
  //               ),
  //             ),
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text(
  //                 transaction.title,
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               Text(
  //                 transaction.amount.toString(),
  //                 style: const TextStyle(
  //                   color: Colors.purple,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               Text(
  //                 transaction.date.toString(),
  //                 style: const TextStyle(
  //                   color: Colors.grey,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  //   itemCount: transactions.length,
  // );
  return const Center(
    child: Text('No transactions added yet'),
  );
}

Widget _buildNoTransactions() {
  return const Center(
    child: Text(
      'No transactions added yet!',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
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
