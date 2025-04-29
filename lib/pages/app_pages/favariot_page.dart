import 'dart:io';
import 'package:digital_identity_vault/provider/custom_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';

class FavariotPage extends StatelessWidget {
  const FavariotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customImageProvider = Provider.of<CustomImageProvider>(context);
    final favoriteImages = customImageProvider.favoriteImages;

    return Scaffold(
      appBar: AppBar(title: Text("Favorite Images")),
      body: favoriteImages.isEmpty
          ? Center(child: Text("No favorite images"))
          : GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: favoriteImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                String docType = favoriteImages[index];
                File? imageFile = customImageProvider.getDocImage(docType);
                return imageFile != null
                    ? InstaImageViewer(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(imageFile, fit: BoxFit.cover),
                        ),
                      )
                    : SizedBox();
              },
            ),
    );
  }
}

// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final Map<String, dynamic> _image = {};
//   //images[aadhar] = value

//   Future<void> pickImage(String docName) async {
//     var pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       _image[docName] = File(pickedImage.path);
//       setState(() {});
//       log(_image.toString());
//     }
//   }

//   File? getDocImage(String docName) {
//     return _image[docName];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               pickImage('aadhar');
//             },
//             child: getDocImage('aadhar') == null
//                 ? Container(
//                     margin: EdgeInsets.all(20),
//                     height: 200,
//                     width: double.maxFinite,
//                     color: Colors.red.shade100,
//                     child: Icon(
//                       Icons.add,
//                       size: 50,
//                     ),
//                   )
//                 : Container(
//                     margin: EdgeInsets.all(20),
//                     height: 200,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         image: DecorationImage(
//                           image: FileImage(getDocImage('aadhar')!),
//                         )),
//                   ),
//           ),
//           GestureDetector(
//             onTap: () {
//               pickImage('pan');
//             },
//             child: getDocImage('pan') == null
//                 ? Container(
//                     margin: EdgeInsets.all(20),
//                     height: 200,
//                     width: double.maxFinite,
//                     color: Colors.red.shade100,
//                     child: Icon(
//                       Icons.add,
//                       size: 50,
//                     ),
//                   )
//                 : Container(
//                     margin: EdgeInsets.all(20),
//                     height: 200,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         image: DecorationImage(
//                           image: FileImage(getDocImage('pan')!),
//                         )),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
