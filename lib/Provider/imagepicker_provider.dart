import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier {
  XFile? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
      );
      if (image != null) {
        _pickedImage = image;
        notifyListeners();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void clearImage() {
    _pickedImage = null;
    notifyListeners();
  }
}
