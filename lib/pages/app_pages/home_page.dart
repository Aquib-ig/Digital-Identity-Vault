import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_identity_vault/common/utilities.dart';
import 'package:digital_identity_vault/pages/app_pages/mian_page.dart';
import 'package:digital_identity_vault/pages/app_pages/profile_page.dart';
import 'package:digital_identity_vault/provider/bottom_sheet_provider.dart';
import 'package:digital_identity_vault/provider/custom_image_provider.dart';
import 'package:digital_identity_vault/widgets/categories_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BottomSheetProvider bottomSheetProvider;
  late CustomImageProvider customImageProvider;

  final user = FirebaseAuth.instance.currentUser!;
  String? fullName;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (userData.exists) {
      setState(() {
        fullName = userData["fullName"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomSheetProvider = Provider.of<BottomSheetProvider>(context);
    customImageProvider = Provider.of<CustomImageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              Utilities.navigateTo(context: context, screen: ProfilePage());
            },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi,\n $fullName",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 25,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                size: 25,
              )),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Cards",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Aadhar Card
                  GestureDetector(
                    onTap: () {
                      customImageProvider.pickImage("aadhar");
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 160,
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
                          child: customImageProvider.getDocImage("aadhar") !=
                                  null
                              ? InstaImageViewer(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      customImageProvider
                                          .getDocImage("aadhar")!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        child: Icon(Icons.add),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Add your Aadhar Card",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                        ),
                        if (customImageProvider.getDocImage("aadhar") != null)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    customImageProvider.removeImage("aadhar");
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    child: Icon(Icons.delete,
                                        color: Colors.white, size: 18),
                                  ),
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    customImageProvider
                                        .toggleFavorite("aadhar");
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor:
                                        customImageProvider.isFavorite("aadhar")
                                            ? Colors.red
                                            : Colors.grey.shade400,
                                    child: Icon(Icons.favorite_sharp,
                                        color: customImageProvider
                                                .isFavorite("aadhar")
                                            ? Colors.white
                                            : Colors.black,
                                        size: 18),
                                  ),
                                ),
                                SizedBox(height: 8),

                                // Share Icon
                                GestureDetector(
                                  onTap: () {
                                    customImageProvider.shareImage("aadhar");
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.share,
                                        color: Colors.white, size: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),
                  // PAN Card

                  GestureDetector(
                    onTap: () {
                      customImageProvider.pickImage("pan");
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 160,
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
                          child: customImageProvider.getDocImage("pan") != null
                              ? InstaImageViewer(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      customImageProvider.getDocImage("pan")!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        child: Icon(Icons.add),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Add your Pan Card",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                        ),
                        if (customImageProvider.getDocImage("pan") != null)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    customImageProvider.removeImage("pan");
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    child: Icon(Icons.delete,
                                        color: Colors.white, size: 18),
                                  ),
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    customImageProvider.toggleFavorite("pan");
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor:
                                        customImageProvider.isFavorite("pan")
                                            ? Colors.red
                                            : Colors.grey.shade400,
                                    child: Icon(Icons.favorite_sharp,
                                        color: customImageProvider
                                                .isFavorite("pan")
                                            ? Colors.white
                                            : Colors.black,
                                        size: 18),
                                  ),
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    customImageProvider.shareImage("aadhar");
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.share,
                                        color: Colors.white, size: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(index: 1),
                      ),
                    );
                  },
                  child: Text(
                    "View more",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoriesContainer(
                  icon: Icons.fingerprint,
                  text: "Identity",
                ),
                CategoriesContainer(
                  icon: Icons.money,
                  text: "Finance",
                ),
                CategoriesContainer(
                  icon: Icons.car_crash,
                  text: "Vehicle",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
