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
        return {
          'days': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      },
    );
  }

  double get maxSpending {
    return groupedTransactionValues.fold<double>(0.0, (sum, item) {
      // print(sum + (item['amount'] as double));
      return sum + (item['amount'] as double);
    });
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
          return Flexible(
            fit: FlexFit.tight,
            // flex: ,
            child: ChartBar(
              data['days'] as String,
              data['amount'] as double,
              maxSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / maxSpending,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                // height: constraints.maxHeight * 0.15,
                child: Text(
                  '\$${spendingAmount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 45,
                width: 10,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: spendingPctOfTotal > 0
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                // height: constraints.maxHeight * 0.15,
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}
