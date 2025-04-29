import 'package:digital_identity_vault/provider/custom_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardContainer extends StatelessWidget {
  final String cardText;
   CardContainer({
    super.key,
    required this.customImageProvider,
    required this.cardText,
  });

  // final BottomSheetProvider bottomSheetProvider;
  late CustomImageProvider customImageProvider;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bottomSheetProvider.bottomSheet(context,"");
            // customImageProvider = Provider.of<CustomImageProvider>(context,listen: false);

      },
      child:  Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    cardText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
