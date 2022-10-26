import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/providers/great_places.dart';
import 'package:greatplaces/widgets/image_input.dart';
import 'package:greatplaces/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  late File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Lugar')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Titulo'),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(this._selectImage),
                  SizedBox(
                    height: 10,
                  ),
                  LocationInput()
                ]),
              ),
            ),
          ),
          TextButton(onPressed: _submitForm, child: Text('Adicionar'))
        ],
      ),
    );
  }
}
