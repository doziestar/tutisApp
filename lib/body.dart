import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widget/helper.dart';
import './widget/transact_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
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
              const TextButton(onPressed: null, child: Text('Add')),
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
        backgroundColor: Colors.green[100],
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 88, 112, 89),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarTextStyle: const TextStyle(color: Colors.white),
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Expense Tracker'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showModalBottomSheet(context);
            },
          )
        ],
        title: const Text("Expense Tracker"),
      ),
      body: transactions.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(8),
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Icon(Icons.attach_money),
                            SizedBox(width: 8),
                            Text('Total Expenses'),
                            SizedBox(width: 8),
                            Text('\$10,000'),
                          ],
                        ),
                      ),
                    ),
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
