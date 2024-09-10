import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/Provider/imagepicker_provider.dart';

import '../../utils/image_source_dialogue.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the picked image
          if (imagePickerProvider.pickedImage != null)
            Image.file(
              File(imagePickerProvider.pickedImage!.path),
              height: 200,
            )
          else
            Text("No image selected"),

          SizedBox(height: 20),

          // Button to pick an image
          ElevatedButton(
            onPressed: () => showImageSourceDialog(context),
            child: Text("Pick Image from Camera"),
          ),

          SizedBox(height: 20),

          // Clear image button
          if (imagePickerProvider.pickedImage != null)
            ElevatedButton(
              onPressed: () {
                imagePickerProvider.clearImage();
              },
              child: Text("Clear Image"),
            ),
        ],
      ),
    );
  }
}
