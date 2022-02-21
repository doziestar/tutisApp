import 'package:flutter/material.dart';

import './models/transaction.dart';

void main() => runApp(const ExpenseTracker());

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
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
              onPressed: () {},
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
                              const TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.title, color: Colors.green),
                                  label: Text(
                                    'Title',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.attach_money_outlined,
                                      color: Colors.green),
                                  label: Text(
                                    'Amount',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
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
                                  onPressed: () {},
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
            : const Center(
                child: Text('No Expenses Added'),
              ),
      ),
    );
  }
}
