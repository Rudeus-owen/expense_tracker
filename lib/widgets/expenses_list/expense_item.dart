import 'package:flutter/material.dart';
import 'package:expense_tracker/modal/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
           Text(expense.title,
           style:Theme.of(context).textTheme.titleLarge),
           const SizedBox(height:4),
           Row(children: [
            Text('\$${expense.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Row(children: [
              Icon(categoryIcons[expense.category]),
              const SizedBox(
                width:8,),
                Text(expense.formattedDate),
            ],)
           ],)
          ],)
      ),
    );
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category,required this.expenses});
    ExpenseBucket.forCategory(List<Expense>allExpenses,this.category)
    :expenses =allExpenses
        .where((expense)=> expense.category ==category)
        .toList();

        final Category category;
        final List<Expense> expenses;

        double get totalExpenses{
          double sum =0;

          for (final expense in expenses) {
            sum += expense.amount;
          }

          return sum;
        }
}