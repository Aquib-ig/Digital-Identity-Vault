import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetProvider extends ChangeNotifier {
  final Map<String, dynamic> _image = {};
  final picker = ImagePicker();

  Future<void> pickImage(String docName) async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image[docName] = File(pickedImage.path);
      notifyListeners(); 
      log(_image.toString());
    }
  }

  File? getDocImage(String docName) {
    return _image[docName];
  }

  Future<void> bottomSheet(BuildContext context, String documentId) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await pickImage(documentId);
                    Navigator.pop(context);
                  },
                  child: const Text("Pick image from Gallery"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    await pickImage(documentId);
                    Navigator.pop(context);
                  },
                  child: const Text("Pick image from Camera"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
