import 'dart:io';

import 'package:expense_tracker/components/new_expense/alert_error.dart';
import 'package:expense_tracker/components/new_expense/amount_widget.dart';
import 'package:expense_tracker/components/new_expense/category_widget.dart';
import 'package:expense_tracker/components/new_expense/date_picker_widget.dart';
import 'package:expense_tracker/components/new_expense/finalizer_buttons.dart';
import 'package:expense_tracker/components/new_expense/text_widget.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense) addExpense;
  const NewExpense(this.addExpense, {super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  void selectCategory(Category? value) {
    if (value == null) {
      return;
    }
    setState(() {
      selectedCategory = value;
    });
  }

  void cancelAddingExpense() {
    titleController.clear();
    amountController.clear();
    Navigator.of(context, rootNavigator: true).pop();
  }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day - 1);
    final userDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      selectedDate = userDate;
    });
  }

  void _showErrorDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => const NewExpenseAlertError(
          isIOS: true,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (ctx) => const NewExpenseAlertError(),
    );
  }

  void submitExpense() {
    final amount = double.tryParse(amountController.text.trim());
    final title = titleController.text.trim();

    if (title.isEmpty ||
        amount == null ||
        amount <= 0 ||
        selectedDate == null) {
      _showErrorDialog();
      return;
    }

    widget.addExpense(
      Expense(
        title: title,
        amount: amount,
        date: selectedDate as DateTime,
        category: selectedCategory,
      ),
    );
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: NewExpenseTextWidget(titleController),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: NewExpenseAmountWidget(amountController),
                      ),
                    ],
                  )
                else
                  NewExpenseTextWidget(titleController),
                if (width >= 600)
                  Row(
                    children: [
                      NewExpenseCategoryWidget(
                        selectedCategory,
                        selectCategory,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: NewExpenseDatePickerWidget(
                          selectedDate,
                          presentDatePicker,
                        ),
                      )
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: NewExpenseAmountWidget(amountController),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: NewExpenseDatePickerWidget(
                          selectedDate,
                          presentDatePicker,
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 16),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ...NewExpenseFinalizerButtons(
                        cancelAddingExpense: cancelAddingExpense,
                        submitExpense: submitExpense,
                      ).buttons,
                    ],
                  )
                else
                  Row(
                    children: [
                      NewExpenseCategoryWidget(
                        selectedCategory,
                        selectCategory,
                      ),
                      const Spacer(),
                      ...NewExpenseFinalizerButtons(
                        cancelAddingExpense: cancelAddingExpense,
                        submitExpense: submitExpense,
                      ).buttons,
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
