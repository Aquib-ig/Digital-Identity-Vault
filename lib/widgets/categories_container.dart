import 'package:digital_identity_vault/provider/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  CategoriesContainer({super.key, required this.icon, required this.text});

  late BottomSheetProvider bottomSheetProvider;

  @override
  Widget build(BuildContext context) {
    bottomSheetProvider = Provider.of<BottomSheetProvider>(context);
    return GestureDetector(
        onTap: () {
          bottomSheetProvider.bottomSheet(context,"");
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon),
              Text(text),
            ],
          ),
        ));
  }
}
