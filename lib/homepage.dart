import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_pair_generator/favourite_controller.provider.dart';
import 'package:word_pair_generator/favourite_page.dart';

final List<String> wordList = [
  'apple',
  'banana',
  'cherry',
  'orange',
  'lemon',
  'grape',
  'kiwi',
  'mango',
  'pear',
  'peach',
  'pineapple',
  'plum',
  'strawberry',
  'blueberry',
  'blackberry',
  'raspberry',
  'watermelon',
  'melon',
  'pomegranate',
  'apricot'
];

class WordPairGenerator extends StatelessWidget {
  const WordPairGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WordPair Generator'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FavouritePage();
              }));
            },
            child: const Center(
              child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.favorite,color: Colors.black,)),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: wordList.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          wordList[index],
                          style: const TextStyle(color: Colors.black,fontSize: 20),
                        ),
                        Consumer(builder: (context, ref, child) {
                          final isFavourite =
                              ref.watch(favouriteCheckProvider(index));
                          
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(favouriteCheckProvider(index).notifier)
                                  .state = !isFavourite;
                              if (isFavourite) {
                                ref
                                    .read(favouriteDataProvider.notifier)
                                    .state
                                    .remove(wordList[index]);
                              } else {
                                ref
                                    .read(favouriteDataProvider.notifier)
                                    .state
                                    .add(wordList[index]);
                              }
                            },
                            child: Icon(
                              Icons.favorite,
                              color: isFavourite ? Colors.red : Colors.grey,
                            ),
                          );
                        })
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                      thickness: 1,
                    )
                  ],
                ));
          }),
    );
  }
}
