import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widget/chart.dart';
import './widget/helper.dart';
import './widget/transact_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );
    setState(
      () {
        transactions.add(newTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        transactions.removeWhere((transaction) => transaction.id == id);
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Amount',
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
                        dateController,
                      );
                      resetTransaction();
                    }
                  },
                  child: const Text('Add')),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          if (value == 1) {_showModalBottomSheet(context)}
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: const Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            const ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarTextStyle: const TextStyle(color: Colors.white),
        flexibleSpace: const FlexibleSpaceBar(
          title: Text(
            'Expense Tracker',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showModalBottomSheet(context);
            },
          )
        ],
      ),
      body: transactions.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Chart(_recentTransactions),
                    AddTransactionCard(_addTransaction),
                    TransactionOutput(_deleteTransaction),
                  ],
                ),
              ),
            )
          : const NoTransactionYet(),
    );
  }
}
