import 'package:expense_tracker/components/header.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/pages/home.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseTrackerAppState();
  }
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);

    setState(() {
      registeredExpenses.remove(expense);
    });

    _messengerKey.currentState!.clearSnackBars();
    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ExpenseTrackerTheme.lightTheme,
      darkTheme: ExpenseTrackerTheme.darkTheme,
      themeMode: ThemeMode.system,
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: Header(addExpense),
        body: HomePage(registeredExpenses, removeExpense),
      ),
    );
  }
}
