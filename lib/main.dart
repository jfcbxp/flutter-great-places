import 'package:flutter/material.dart';
import 'package:greatplaces/screens/place_form_screen.dart';
import 'package:greatplaces/screens/places_list_screen.dart';
import 'package:greatplaces/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meus Lugares',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PlacesListScreen(),
      routes: {AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen()},
    );
  }
}
