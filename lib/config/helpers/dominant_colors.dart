import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image/image.dart' as imagelib;

class DominantColors {
  // We want to extract two dominant colors
  DominantColors({required this.bytes, required this.dominantColorsCount});
  final Uint8List bytes;
  int dominantColorsCount = 2;

  // Calculate Euclidean distance between two colors
  double distance(Color a, Color b) {
    return sqrt(pow(a.r - b.r, 2) + pow(a.g - b.g, 2) + pow(a.b - b.b, 2));
  }

  // Cluster colors using K-means++ and return centroids
  List<Color> extractDominantColors() {
    List<Color> colors = _getPixelsColorsFromHalfImage();
    List<Color> centroids = _initializeCentroids(colors);
    List<Color> oldCentroids = [];

    while (_isConverging(centroids, oldCentroids)) {
      oldCentroids = List.from(centroids);
      List<List<Color>> clusters = List.generate(
        dominantColorsCount,
        (index) => [],
      );

      for (var color in colors) {
        int closestIndex = _findClosestCentroid(color, centroids);
        clusters[closestIndex].add(color);
      }

      for (int i = 0; i < dominantColorsCount; i++) {
        centroids[i] = _averageColor(clusters[i]);
      }
    }

    return centroids;
  }

  // Initialize centroids using K-means++
  List<Color> _initializeCentroids(List<Color> colors) {
    final random = Random();
    List<Color> centroids = [];
    centroids.add(colors[random.nextInt(10)]);

    for (int i = 1; i < dominantColorsCount; i++) {
      List<double> distances = colors
          .map(
            (color) => centroids
                .map((centroid) => distance(color, centroid))
                .reduce(min),
          )
          .toList();

      double sum = distances.reduce((a, b) => a + b);
      double r = random.nextDouble() * sum;

      double accumulatedDistance = 0.0;
      for (int j = 0; j < colors.length; j++) {
        accumulatedDistance += distances[j];
        if (accumulatedDistance >= r) {
          centroids.add(colors[j]);
          break;
        }
      }
    }

    return centroids;
  }

  List<Color> _getPixelsColorsFromHalfImage() {
    List<Color> colors = [];

    imagelib.Image? image = imagelib.decodeImage(bytes.buffer.asUint8List());

    if (image != null) {
      int sampling =
          5; //sampling, Adjust as needed. 5 means every 5th pixel, etc.

      var width = image.width;
      var height = image.height;
      if (width > 1300) {
        sampling = 10;
      }
      var heightTakenForColors =
          height /
          2; //half of the image is always enough, compared to full image
      var widthTakenForColors = width / 2;

      for (int y = 0; y < heightTakenForColors; y += sampling) {
        for (int x = 0; x < widthTakenForColors; x += sampling) {
          var pixel = image.getPixel(x, y);
          // Extract the red, green, blue and alpha components from the pixel
          int r = pixel.r.toInt();
          int g = pixel.g.toInt();
          int b = pixel.b.toInt();
          int a = pixel.a.toInt();

          //Color color = Color.fromARGB(a, r, g, b);
          colors.add(Color.fromARGB(a, r, g, b));
        }
      }
    }

    return colors;
  }

  bool _isConverging(List<Color> centroids, List<Color> oldCentroids) {
    if (oldCentroids.isEmpty) return true;
    for (int i = 0; i < centroids.length; i++) {
      if (centroids[i] != oldCentroids[i]) return true;
    }
    return false;
  }

  int _findClosestCentroid(Color color, List<Color> centroids) {
    int minIndex = 0;
    double minDistance = distance(color, centroids[0]);
    for (int i = 1; i < centroids.length; i++) {
      double dist = distance(color, centroids[i]);
      if (dist < minDistance) {
        minDistance = dist;
        minIndex = i;
      }
    }
    return minIndex;
  }

  Color _averageColor(List<Color> colors) {
    double r = 0, g = 0, b = 0;
    for (var color in colors) {
      r += color.r;
      g += color.g;
      b += color.b;
    }
    int length = colors.length;
    r = r / length;
    g = g / length;
    b = b / length;
    return Color.fromRGBO(r.toInt(), g.toInt(), b.toInt(), 1);
  }

  Future<Uint8List> fetchImage(String photoUrl) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(photoUrl));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }
}
