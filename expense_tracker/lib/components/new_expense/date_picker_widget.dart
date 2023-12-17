import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';

class NewExpenseDatePickerWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function() presentDatePicker;

  const NewExpenseDatePickerWidget(
    this.selectedDate,
    this.presentDatePicker, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedDate == null
              ? 'No date selected'
              : kDateFormatter.format(selectedDate!),
        ),
        IconButton(
          onPressed: presentDatePicker,
          icon: const Icon(Icons.calendar_month),
        )
      ],
    );
  }
}
