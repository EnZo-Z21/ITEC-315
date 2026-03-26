import 'package:expense_tracker_sp26/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Ginos Pizza', amount: 25.00, date: DateTime.now(), category: Category.food),
    Expense(title: 'Train Ticket to MA', amount: 15.25, date: DateTime.now(), category: Category.travel),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Chart Goes Here'),
          SizedBox(height: 30),
          Text('List of expenses goes here')
        ],
      ),
    );
  }
}