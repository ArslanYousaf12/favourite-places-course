import 'package:flutter/material.dart';

class NewPlaceScreen extends StatelessWidget {
  NewPlaceScreen({super.key});
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              print(_textEditingController.text);
              _textEditingController.clear();
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
