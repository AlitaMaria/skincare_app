import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skincare_task/utilities/utilities.dart';
// import 'package:skincare_task/views/category.dart';
import 'package:skincare_task/views/home/home.dart';
// import 'package:skincare_task/utilities/widgets/botton_navigation.dart';
// import 'package:skincare_task/utilities/botton_navigation.dart';
// import 'package:skincare_task/utilities/widgets/widgets.dart';
// import 'package:skincare_task/utilities/textstyles.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  static String route = '/MainScreen';

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    Homescreen(),
    Center(child: Text(' Favorites Content', style: TextStyle(fontSize: 30))),
    Center(child: Text(' Menu Content', style: TextStyle(fontSize: 30))),
    Center(child: Text(' Profile Content', style: TextStyle(fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        // surfaceTintColor: AppColors.background,
        backgroundColor: AppColors.background,

        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Center(
          child: Image.asset(
            "assets/images/image 8.png",
            height: 46,
            width: 78,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ],
      ),

      body: Center(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,

        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.buttoncolor,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Home.svg",
              height: 24,
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/element-3.svg",
              height: 24,
              width: 24,
            ),

            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/heart.png", height: 24, width: 24),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Profile (1).svg",
              height: 24,
              width: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
