import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpenseCategoryWidget extends StatelessWidget {
  final Category selectedCategory;
  final void Function(Category?) selectCategory;

  const NewExpenseCategoryWidget(
    this.selectedCategory,
    this.selectCategory, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name.toUpperCase()),
            ),
          )
          .toList(),
      onChanged: selectCategory,
    );
  }
}
