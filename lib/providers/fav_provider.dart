import 'package:flutter_riverpod/flutter_riverpod.dart';

// stateProvider

// final favProvider = StateProvider((ref) => <String>[]);

// StateNotifier

class FavoriteNotifier extends StateNotifier<List<String>> {
  FavoriteNotifier() : super(<String>[]);

  void addNewItem(String newItem) {
    state = [...state, newItem];
  }
}

final favProvider = StateNotifierProvider<FavoriteNotifier, List<String>>(
    (ref) => FavoriteNotifier());
