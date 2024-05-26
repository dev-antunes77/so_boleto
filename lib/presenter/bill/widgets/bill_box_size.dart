import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';

class BillBoxSize extends StatelessWidget {
  const BillBoxSize({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.95,
      height: height ?? context.height * 0.45,
      child: child,
    );
  }
}
