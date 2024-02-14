import 'package:flutter/material.dart';

class FavouritePlacesScreen extends StatefulWidget {
  const FavouritePlacesScreen({super.key});

  @override
  State<FavouritePlacesScreen> createState() => _FavouritePlacesScreenState();
}

class _FavouritePlacesScreenState extends State<FavouritePlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourte Places'),
      ),
    );
  }
}
