import 'package:flutter/material.dart';

class FavouritePlacesScreen extends StatefulWidget {
  const FavouritePlacesScreen({super.key});

  @override
  State<FavouritePlacesScreen> createState() => _FavouritePlacesScreenState();
}

class _FavouritePlacesScreenState extends State<FavouritePlacesScreen> {
  final List<String> _favouritePlaces = ['Layyah', 'Lahore', 'Multan'];
  @override
  Widget build(BuildContext context) {
    Widget activeContent;
    if (_favouritePlaces.isEmpty || _favouritePlaces == null) {
      activeContent = const Center(
        child: Text(
          'No Favourite Place added yet.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
    } else {
      activeContent = ListView.separated(
        itemCount: _favouritePlaces.length,
        itemBuilder: (context, index) {
          return Text(
            _favouritePlaces[index].toString(),
            style: const TextStyle(fontSize: 30, color: Colors.white),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourte Places'),
      ),
      body: activeContent,
    );
  }
}
