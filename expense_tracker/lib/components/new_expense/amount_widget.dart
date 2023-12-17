import 'package:flutter/material.dart';

class NewExpenseAmountWidget extends StatelessWidget {
  final TextEditingController amountController;

  const NewExpenseAmountWidget(this.amountController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('Amount'),
        prefixText: '\$ ',
      ),
    );
  }
}
