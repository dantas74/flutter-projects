import 'package:expense_tracker/components/new_expense/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final void Function(Expense) addExpense;
  const Header(this.addExpense, {super.key});

  void openAddExpenseForm(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flutter Expense Tracker'),
      actions: [
        IconButton(
          onPressed: () {
            openAddExpenseForm(context);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
