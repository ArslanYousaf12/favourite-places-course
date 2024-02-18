import 'package:favourite_place_course/widgets/add_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:favourite_place_course/providers/user_places.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _imagePicked;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _imagePicked == null) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _imagePicked!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AddImage(
              imagePicker: (image) {
                _imagePicked = image;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
