import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class CheckPayedTag extends StatelessWidget {
  const CheckPayedTag(this.showTag, {super.key, required this.color});

  final bool showTag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return showTag
        ? Positioned(
            right: 0,
            top: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(
                      175,
                      (175 * 0.5833333333333334)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: LabelCustomPainter(color),
                ),
                const Positioned(
                  right: 2,
                  top: 2,
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 23,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

class LabelCustomPainter extends CustomPainter {
  LabelCustomPainter(this.color, {super.repaint});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9983333, size.height * 0.0014286);
    path_0.lineTo(size.width * 0.9991667, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.7091667, size.height * 0.0014286);
    path_0.lineTo(size.width * 0.9983333, size.height * 0.0014286);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
