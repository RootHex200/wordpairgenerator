import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_pair_generator/favourite_controller.provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Page'),
          centerTitle: true,
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final favouriteList = ref.watch(favouriteDataProvider);
            return ListView.builder(
                itemCount: favouriteList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            favouriteList[index],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.1),
                            thickness: 1,
                          )
                        ],
                      ));
                });
          },
        ));
  }
}
