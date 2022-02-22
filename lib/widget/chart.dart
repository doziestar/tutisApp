import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutis/models/transaction.dart';

class Chart extends StatelessWidget {
  List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        var totalSum = 0.0;
        for (var i = 0; i < transactions.length; i++) {
          if (transactions[i].date.day == weekDay.day &&
              transactions[i].date.month == weekDay.month &&
              transactions[i].date.year == weekDay.year) {
            totalSum += transactions[i].amount;
          }
        }
        return {'days': DateFormat.E().format(weekDay), 'amount': totalSum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return ChartBar(
            data['days'] as String,
            data['amount'] as double,
            // (data['amount'] as double).isNegative ? Colors.red : Colors.green,
          );
        }).toList(),
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  // final spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SizedBox(
          height: 100,
          child: Column(
            children: [
              SizedBox(
                // height: constraints.maxHeight * 0.15,
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
              SizedBox(
                // height: constraints.maxHeight * 0.05,
                child: FractionallySizedBox(
                  // widthFactor: spendingPctOfTotal,
                  child: Container(
                    // height: constraints.maxHeight * 0.05,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                // height: constraints.maxHeight * 0.15,
                child: Text(label),
              ),
            ],
          ),
        );
      },
    );
  }
}

//  Container(
//             padding: const EdgeInsets.all(2),
//             margin: const EdgeInsets.all(2),
//             child: Column(
//               children: [
//                 Text(
//                   '${data['days']}',
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   '\$${data['amount']}',
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           );