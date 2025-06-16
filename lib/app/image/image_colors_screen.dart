import 'dart:typed_data';

import 'package:fl_animaciones/config/config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageColorsScreen extends StatefulWidget {
  const ImageColorsScreen({super.key});
  static const String route = '/image_colors';

  @override
  State<ImageColorsScreen> createState() => _ImageColorsScreenState();
}

class _ImageColorsScreenState extends State<ImageColorsScreen> {
  Uint8List? bytes;

  void _onImageSelect() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    bytes = await result.readAsBytes();
    setState(() {});
  }

  Future<List<Color>> loadColors() async {
    if (bytes == null) return [];
    return ImageUtils.getColorsFromImage(MemoryImage(bytes!));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colores'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _onImageSelect, icon: Icon(Icons.camera)),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (bytes != null)
              SizedBox(
                height: size.height * 0.6,
                width: size.width * 0.9,
                child: Image.memory(bytes!, fit: BoxFit.cover),
              ),
            FutureBuilder<List<Color>>(
              future: loadColors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (final color in snapshot.requireData)
                            Container(height: 70, width: 30, color: color),
                        ],
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: snapshot.requireData,
                          ),
                        ),
                      ),
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
