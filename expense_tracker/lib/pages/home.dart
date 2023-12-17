import 'package:expense_tracker/components/chart/chart.dart';
import 'package:expense_tracker/components/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Expense> _expenses;
  final void Function(Expense) removeExpense;

  const HomePage(this._expenses, this.removeExpense, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(expenses: _expenses, removeExpense);
    }

    return width < 600
        ? Column(
            children: [
              Chart(expenses: _expenses),
              Expanded(
                child: mainContent,
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Chart(expenses: _expenses),
              ),
              Expanded(
                child: mainContent,
              ),
            ],
          );
  }
}
