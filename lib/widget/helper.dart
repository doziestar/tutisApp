import 'package:flutter/material.dart';

final titleController = TextEditingController();
final amountController = TextEditingController();

void resetTransaction() {
  titleController.clear();
  amountController.clear();
}
