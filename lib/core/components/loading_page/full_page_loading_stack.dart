import 'package:flutter/material.dart';

class FullPageLoadingStack extends StatelessWidget {
  const FullPageLoadingStack({
    super.key,
    required this.child,
    required this.overlayBuilder,
  });

  final Widget child;
  final Widget overlayBuilder;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [child, overlayBuilder],
      ),
    );
  }
}
