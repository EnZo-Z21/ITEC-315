import 'package:expense_tracker_sp26/models/expense.dart';
import 'package:expense_tracker_sp26/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_sp26/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, 
    builder: (ctx) => NewExpense());
  }
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Ginos Pizza', amount: 25.00, date: DateTime.now(), category: Category.food),
    Expense(title: 'Train Ticket to MA', amount: 15.25, date: DateTime.now(), category: Category.travel),
    Expense(title: 'Movie Ticket', amount: 18.00, date: DateTime.now(), category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(icon: Icon(Icons.add), 
          onPressed: _openAddExpenseOverlay
          )
        ],
      ),
      body: Column(
        children: [
          Text('Chart Goes Here'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}