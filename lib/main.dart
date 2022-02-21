import 'package:flutter/material.dart';

import './models/transaction.dart';

void main() => runApp(const ExpenseTracker());

final titleController = TextEditingController();
final amountController = TextEditingController();

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
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

  void _resetTransaction() {
    titleController.clear();
    amountController.clear();
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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
    return MaterialApp(
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => {
            if (value == 1) {_showModalBottomSheet()}
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
                _showModalBottomSheet();
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
                      Card(
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
                                  icon: Icon(Icons.attach_money_outlined,
                                      color: Colors.green),
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
                                    _resetTransaction();
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
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 300,
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
                                    _deleteTransaction(transactions[index].id);
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
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(
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
                        ))
                  ],
                )),
      ),
    );
  }
}

class AddTransactionModal extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // final VoidCallback addTransaction;

  // AddTransactionModal(this.addTransaction)

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Transaction'),
      content: SingleChildScrollView(
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
                  // addTransaction();

                  Navigator.pop(context);
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
