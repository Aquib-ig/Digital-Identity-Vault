import 'dart:io';

import 'package:digital_identity_vault/provider/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final File docImage;
  final String documentId;

  const ImageContainer({
    super.key,
    required this.bottomSheetProvider,
    required this.docImage,
    required this.documentId,
  });

  final BottomSheetProvider bottomSheetProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheetProvider.bottomSheet(context, documentId);
      },
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.blue,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.file(docImage),
      ),
    );
  }
}
