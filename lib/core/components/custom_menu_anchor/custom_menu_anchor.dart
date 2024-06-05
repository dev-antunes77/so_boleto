import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';

class CustomMenuAnchor extends StatelessWidget {
  const CustomMenuAnchor({
    super.key,
    required this.mainIcon,
    this.mainIconHeight,
    required this.firstChildIcon,
    required this.firstChildLabel,
    required this.onfirstChildPressed,
    required this.secondChildIcon,
    required this.secondChildLabel,
    required this.onsecondChildPressed,
  });

  final String mainIcon;
  final double? mainIconHeight;
  final String firstChildIcon;
  final String firstChildLabel;
  final VoidCallback onfirstChildPressed;
  final String secondChildIcon;
  final String secondChildLabel;
  final VoidCallback onsecondChildPressed;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (
        BuildContext context,
        MenuController controller,
        Widget? child,
      ) {
        return ActionButton(
          icon: mainIcon,
          height: mainIconHeight,
          onTap: () =>
              controller.isOpen ? controller.close() : controller.open(),
        );
      },
      menuChildren: [
        MenuItemButton(
          leadingIcon: SvgAsset(
            svg: firstChildIcon,
            height: 22,
          ),
          onPressed: onfirstChildPressed,
          child: Text(firstChildLabel),
        ),
        MenuItemButton(
          leadingIcon: SvgAsset(
            svg: secondChildIcon,
            height: 22,
          ),
          onPressed: onsecondChildPressed,
          child: Text(secondChildLabel),
        ),
      ],
    );
  }
}