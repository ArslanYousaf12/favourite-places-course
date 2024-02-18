import 'package:favourite_place_course/providers/fav_provider.dart';
import 'package:favourite_place_course/screens/new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritePlacesScreen extends ConsumerStatefulWidget {
  const FavouritePlacesScreen({super.key});

  @override
  ConsumerState<FavouritePlacesScreen> createState() =>
      _FavouritePlacesScreenState();
}

class _FavouritePlacesScreenState extends ConsumerState<FavouritePlacesScreen> {
  // final List<String> _favouritePlaces = ['Layyah', 'Lahore', 'Multan'];
  @override
  Widget build(BuildContext context) {
    ref.watch(favProvider);
    List<String> favouritePlaces = ref.read(favProvider.notifier).state;

    Widget activeContent;
    // if (_favouritePlaces.isEmpty || _favouritePlaces == null) {
    //   activeContent = const Center(
    //     child: Text(
    //       'No Favourite Place added yet.',
    //       style: TextStyle(
    //         fontSize: 20,
    //         color: Colors.white,
    //       ),
    //     ),
    //   );
    // } else {
    activeContent = ListView.separated(
      itemCount: favouritePlaces.length,
      itemBuilder: (context, index) {
        return Text(
          favouritePlaces[index].toString(),
          style: const TextStyle(fontSize: 30, color: Colors.white),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
    );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourte Places'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return NewPlaceScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: activeContent,
    );
  }
}
