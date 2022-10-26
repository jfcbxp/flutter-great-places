import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 180,
        height: 100,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        alignment: Alignment.center,
        child: Text('Nenhuma Imagem'),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(child: TextButton(onPressed: () {}, child: Text('Tirar Foto')))
    ]);
  }
}
