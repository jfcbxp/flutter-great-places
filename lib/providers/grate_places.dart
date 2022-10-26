import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:greatplaces/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place getItemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: Random().nextDouble().toString(),
        title: title,
        location: PlaceLocation(latitude: 1, longitude: 1, address: 't'),
        image: image);

    _items.add(newPlace);
    notifyListeners();
  }
}
