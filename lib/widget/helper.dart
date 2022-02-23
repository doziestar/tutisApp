import 'package:flutter/material.dart';

final titleController = TextEditingController();
final amountController = TextEditingController();
DateTime dateController = DateTime.now();

void resetTransaction() {
  titleController.clear();
  amountController.clear();
  // dateController.
}
