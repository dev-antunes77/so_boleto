import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_box_size.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BillBoxSize(
      height: context.height * 0.8,
      child: child,
    );
  }
}
