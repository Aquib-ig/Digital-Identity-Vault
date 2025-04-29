import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digital_identity_vault/pages/app_pages/collection_page.dart';
import 'package:digital_identity_vault/pages/app_pages/favariot_page.dart';
import 'package:digital_identity_vault/pages/app_pages/home_page.dart';
import 'package:digital_identity_vault/pages/app_pages/setting_page.dart';
import 'package:digital_identity_vault/provider/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final int index;
  const MainPage({
    super.key,
    this.index = 0,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BottomSheetProvider bottomSheetProvider;
  int _selectedIndex = 0;

  List<Widget> screens = [
    HomePage(),
    CollectionPage(),
    Spacer(),
    FavariotPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bottomSheetProvider = Provider.of<BottomSheetProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // The screen content
          screens[_selectedIndex],

          // Bottom navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              index: _selectedIndex,
              color: Colors.amber,
              backgroundColor: Colors.white,
              animationDuration: const Duration(milliseconds: 400),
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                Icon(Icons.home_filled),
                Icon(Icons.collections),
                Spacer(),
                Icon(Icons.favorite),
                Icon(Icons.settings),
              ],
            ),
          ),

          // Floating Action Button in the middle
          Positioned(
            bottom: 40, // Adjust this to position the FAB where you want
            left: MediaQuery.of(context).size.width / 2 -
                30, // Center the FAB horizontally
            child: FloatingActionButton(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: CircleBorder(),
              onPressed: () {
                bottomSheetProvider.bottomSheet(context, "");
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
