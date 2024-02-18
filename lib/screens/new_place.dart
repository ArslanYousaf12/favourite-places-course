import 'package:favourite_place_course/providers/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerWidget {
  NewPlaceScreen({super.key});
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Favourite Place'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            maxLength: 54,
            decoration: const InputDecoration(
              label: Text('Place'),
            ),
            onChanged: (value) {},
          ),
          ElevatedButton.icon(
            onPressed: () {
              //State provider

              // final newList = [
              //   ...ref.read(favProvider.notifier).state,
              //   _textEditingController.text
              // ];
              // ref.read(favProvider.notifier).state = newList;

              //StateNotifier
              ref
                  .read(favProvider.notifier)
                  .addNewItem(_textEditingController.text);
              _textEditingController.clear();
              Navigator.of(context).pop();
              print(ref.watch(favProvider));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          ),
          // Container(
          //   height: 50,
          //   width: 120,
          //   child: Row(
          //     children: [],
          //   ),
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(100),
          //     ),
          //     color: Colors.black54,
          //   ),
          // )
        ],
      ),
    );
  }
}
