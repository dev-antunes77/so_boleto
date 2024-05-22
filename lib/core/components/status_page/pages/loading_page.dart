import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, this.color, this.hasAppBar = false});

  final Color? color;
  final bool hasAppBar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hasAppBar ? context.heightWithoutBottomBar : context.height,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
