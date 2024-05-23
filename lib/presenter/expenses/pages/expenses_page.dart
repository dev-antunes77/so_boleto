import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Container(
        color: Colors.greenAccent,
      ),
    );
  }
}
