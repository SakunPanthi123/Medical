import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
  }) : _imagePicker = imagePicker ?? ImagePicker();

  final ImagePicker _imagePicker;

  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
  }) async {
    return await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
  }
}
