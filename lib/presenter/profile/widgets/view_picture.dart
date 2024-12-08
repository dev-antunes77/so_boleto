import 'dart:io';

import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/domain/models/image_model.dart';

class ViewPicture extends StatelessWidget {
  const ViewPicture(
    this.image, {
    super.key,
  });

  final String image;
  // final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: context.width,
          child: Image.file(File(image)),
          // child: Image.file(File(image.path)),
        ),
      ),
    );
  }
}
