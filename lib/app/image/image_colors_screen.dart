import 'dart:typed_data';

import 'package:fl_animaciones/config/config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageColorsScreen extends StatefulWidget {
  const ImageColorsScreen({super.key});
  static const String route = '/image_colors';

  @override
  State<ImageColorsScreen> createState() => _ImageColorsScreenState();
}

class _ImageColorsScreenState extends State<ImageColorsScreen> {
  Uint8List? _pickedFile;

  List<Color> get imageColors {
    if (_pickedFile == null) return [];
    return DominantColors(
      bytes: _pickedFile!,
      dominantColorsCount: 8,
    ).extractDominantColors();
  }

  void _onImageSelect() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    _pickedFile = await result.readAsBytes();
    setState(() {});
  }

  Future<List<Color>> loadColors() async {
    if (_pickedFile == null) return [];
    final res = await PaletteGenerator.fromImageProvider(
      MemoryImage(_pickedFile!),
      maximumColorCount: 8,
    );
    return res.colors.toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Colores'), centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _onImageSelect,
              child: SizedBox(
                height: size.height * 0.6,
                width: size.width * 0.9,
                child: _pickedFile == null
                    ? const Placeholder()
                    : Image.memory(_pickedFile!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (final color in imageColors)
                  Container(height: 70, width: 30, color: color),
              ],
            ),
            const SizedBox(height: 30),
            FutureBuilder<List<Color>>(
              future: loadColors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (final color in snapshot.requireData)
                        Container(height: 70, width: 30, color: color),
                    ],
                  );
                }
                return Text('Error al cargar ${snapshot.error}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
