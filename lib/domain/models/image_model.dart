import 'package:image_picker/image_picker.dart';

class ImageModel {
  ImageModel({
    required this.path,
  });

  final String path;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'path': path,
      };

  factory ImageModel.fromXfile(XFile file) => ImageModel(
        path: file.path,
      );
}
