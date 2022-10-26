import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage, {super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage = File('assets/add-image.png');

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    //widget.onSelectImage(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 180,
        height: 100,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        alignment: Alignment.center,
        child: _storedImage != null
            ? Image.file(
                _storedImage,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Text('Nenhuma Imagem'),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
          child: TextButton(onPressed: _takePicture, child: Text('Tirar Foto')))
    ]);
  }
}
