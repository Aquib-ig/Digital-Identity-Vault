import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:share_plus/share_plus.dart';

class CustomImageProvider extends ChangeNotifier {
  final Map<String, File> _images = {};
  final Set<String> _favorites = {};

  Future<void> pickImage(String docName) async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      _images[docName] = imageFile;
      notifyListeners();
    }
  }

  File? getDocImage(String docName) {
    return _images[docName];
  }

  void removeImage(String docType) {
    _images.remove(docType);
    _favorites.remove(docType);
    notifyListeners();
  }

  void toggleFavorite(String docType) {
    if (_favorites.contains(docType)) {
      _favorites.remove(docType);
    } else {
      _favorites.add(docType);
    }
    notifyListeners();
  }

  bool isFavorite(String docType) {
    return _favorites.contains(docType);
  }

  List<String> get favoriteImages => _favorites.toList();

  Future<void> shareImage(String docType) async {
    if (_images.containsKey(docType)) {
      await Share.shareXFiles([XFile(_images[docType]!.path)]);
    }
  }
}
