import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tour_mate/features/map/map_screen.dart';

import '../profile/profile_screen.dart';

@RoutePage()
class MainScaffoldScreen extends StatefulWidget {
  const MainScaffoldScreen({Key? key}) : super(key: key);

  @override
  State<MainScaffoldScreen> createState() => _MainScaffoldScreenState();
}

class _MainScaffoldScreenState extends State<MainScaffoldScreen> {
  PageController pageController = PageController();
  int index = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          // DashboardScreen(),
          // MyProgramsScreen(),
          // NotificationsScreen(),
          MapScreen(),
          ProfileScreen(),
          ProfileScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black26,
        showUnselectedLabels: true,
        elevation: 0,
        onTap: (value) {
          setState(() {
            index = value;
            pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
