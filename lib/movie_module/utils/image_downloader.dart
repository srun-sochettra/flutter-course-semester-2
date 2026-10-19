import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class ImageDownloader {

  Future<void> downloadImage(BuildContext context, String imageUrl) async {
    try {
      final dir = await getTemporaryDirectory();

      final filePath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      await Dio().download(imageUrl, filePath);

      await GallerySaver.saveImage(filePath);

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Image saved')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Download failed: $e')));
      }
    }
  }
}
