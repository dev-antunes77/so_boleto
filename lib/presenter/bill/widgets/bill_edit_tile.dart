import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillEditTile extends StatelessWidget {
  const BillEditTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    required this.color,
    this.width,
  });

  final String icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0.0,
      onTap: onTap,
      dense: true,
      leading: SvgAsset(
        svg: icon,
        height: 32,
        color: color,
      ),
      title: Text(label),
      subtitle: Row(
        children: [
          Flexible(
            flex: 7,
            child: Text(
              value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: AppThemeValues.spaceXSmall),
              child: Icon(Icons.edit_outlined, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
