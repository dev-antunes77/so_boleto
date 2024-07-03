import 'package:flutter/material.dart';

class CustomMenuAnchor extends StatelessWidget {
  const CustomMenuAnchor({
    super.key,
    required this.builder,
    required this.menuChildren,
    this.alignment,
  });

  final Widget Function(BuildContext, MenuController, Widget?)? builder;
  final List<Widget> menuChildren;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        alignment: alignment,
        elevation: const WidgetStatePropertyAll(12),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(8),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      builder: builder,
      menuChildren: menuChildren,
    );
  }
}
