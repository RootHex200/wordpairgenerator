import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteCheckProvider = StateProvider.family<bool,int>((ref,index) {
  return false;
});


final favouriteDataProvider = StateProvider<List<String>>((ref) {
  List<String> favouriteList = [];
  return favouriteList;
});