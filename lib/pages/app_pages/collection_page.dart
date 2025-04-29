import 'package:digital_identity_vault/widgets/doc_field.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Docuwallet', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DocField(
                onPressed: () {},
                title: "My Family Docs",
                subtitle: "",
                icon: Icons.family_restroom,
                color: Colors.deepPurple),
            SizedBox(height: 20),
            Text('Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DocField(
                onPressed: () {},
                title: "Identity",
                subtitle: "",
                icon: Icons.verified_user,
                color: Colors.teal),
            DocField(
                onPressed: () {},
                title: "Finance",
                subtitle: "",
                icon: Icons.account_balance_outlined,
                color: Colors.blue),
            DocField(
                onPressed: () {},
                title: "Education",
                subtitle: "",
                icon: Icons.book_rounded,
                color: Colors.red),
          ],
        ),
      ),
    );
  }

  // Widget _buildGroupTile() {
  //   return Container(
  //     padding: EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.blue,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text('My Family Docs',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.bold)),
  //             SizedBox(height: 4),
  //             Text('5 docs', style: TextStyle(color: Colors.white70)),
  //           ],
  //         ),
  //         Text('2 members', style: TextStyle(color: Colors.white70)),
  //       ],
  //     ),
  //   );
}

//   Widget _buildCategoryTile(
//       String title, String subtitle, IconData icon, Color color) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: color.withOpacity(0.2),
//             child: Icon(icon, color: color),
//           ),
//           SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               SizedBox(height: 4),
//               Text(subtitle, style: TextStyle(color: Colors.grey[600])),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

    // bottomSheetProvider.image != null
    //     ? Image.file(
    //         bottomSheetProvider.image!,
    //         fit: BoxFit.cover,
    //       )
    //     : const Text("No image selected"),
    // const SizedBox(height: 20),
  

// SizedBox(
//               height: 160,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       customImageProvider.pickImage("aadhar");
//                     },
//                     child: customImageProvider.getDocImage("aadhar") != null
//                         ? InstaImageViewer(
//                             child: Container(
//                               height: 200,
//                               width: 300,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   image: DecorationImage(
//                                     image: FileImage(customImageProvider
//                                         .getDocImage("aadhar")!),
//                                     fit: BoxFit.cover,
//                                   )),
//                             ),
//                           )
//                         : GestureDetector(
//                             onTap: () {
//                               customImageProvider.pickImage("aadhar");
//                             },
//                             child: Container(
//                               height: 200,
//                               width: 300,
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.blue.shade100,
//                                     Colors.blue,
//                                   ],
//                                 ),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 22,
//                                     backgroundColor: Colors.white,
//                                     foregroundColor: Colors.blue,
//                                     child: Icon(
//                                       Icons.add,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     "Add your AadharCard",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                   ),
//                   SizedBox(width: 20),
//                   GestureDetector(
//                     onTap: () {
//                       customImageProvider.pickImage("pan");
//                     },
//                     child: customImageProvider.getDocImage("pan") != null
//                         ? InstaImageViewer(
//                             child: Container(
//                               height: 200,
//                               width: 300,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   image: DecorationImage(
//                                     image: FileImage(customImageProvider
//                                         .getDocImage("pan")!),
//                                     fit: BoxFit.cover,
//                                   )),
//                             ),
//                           )
//                         : GestureDetector(
//                             onTap: () {
//                               customImageProvider.pickImage("pan");
//                             },
//                             child: Container(
//                               height: 200,
//                               width: 300,
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.blue.shade100,
//                                     Colors.blue,
//                                   ],
//                                 ),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 22,
//                                     backgroundColor: Colors.white,
//                                     foregroundColor: Colors.blue,
//                                     child: Icon(
//                                       Icons.add,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     "Add your PanCard",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                   ),
//                 ],
//               ),
//             ),