import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/Provider/imagepicker_provider.dart';
import 'package:todo_provider/utils/image_source_dialogue.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImagePickerProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (provider.pickedImage != null)
                GestureDetector(
                  onTap: () {
                    print('gg');
                    showImageSourceDialog(context);
                  },
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage:
                        FileImage(File(provider.pickedImage!.path)),
                  ),
                )
              else
                GestureDetector(
                  onTap: () {
                    print('gg');
                    showImageSourceDialog(context);
                  },
                  child: CircleAvatar(
                    maxRadius: 60,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
