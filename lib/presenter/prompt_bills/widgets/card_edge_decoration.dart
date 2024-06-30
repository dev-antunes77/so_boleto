import 'package:flutter/material.dart';

class CardEdgeDecoration extends StatelessWidget {
  const CardEdgeDecoration({
    super.key,
    required this.alignment,
    required this.color,
    this.bottomLeftRadius = false,
    this.topLefttRadius = false,
    this.bottomRightRadius = false,
    this.topRightRadius = false,
  });

  final Alignment alignment;
  final bool bottomLeftRadius;
  final bool topLefttRadius;
  final bool bottomRightRadius;
  final bool topRightRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              bottomLeft:
                  bottomLeftRadius ? const Radius.circular(10) : Radius.zero,
              topLeft: topLefttRadius ? const Radius.circular(10) : Radius.zero,
              bottomRight:
                  bottomRightRadius ? const Radius.circular(10) : Radius.zero,
              topRight:
                  topRightRadius ? const Radius.circular(10) : Radius.zero,
            ),
          ),
          child: const SizedBox(
            height: 14,
            width: 14,
          ),
        ),
      ),
    );
  }
}
