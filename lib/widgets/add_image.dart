import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _pickedImage;
  void _takePhoto() async {
    final imagePicker = ImagePicker();
    final selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (selectedImage == null) {
      return;
    }
    setState(() {
      _pickedImage = File(selectedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePhoto,
      icon: const Icon(Icons.camera),
      label: const Text('Add Image'),
    );
    if (_pickedImage != null) {
      content = GestureDetector(
        onTap: () {
          _takePhoto();
        },
        child: Image.file(
          _pickedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        child: content);
  }
}
