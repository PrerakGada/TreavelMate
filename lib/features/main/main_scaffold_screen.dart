import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_mate/features/home/home_screen.dart';
import 'package:tour_mate/features/itenary/itenary_screen.dart';
import 'package:tour_mate/features/map/map_screen.dart';
import 'package:tour_mate/features/schedule/schedule_screen.dart';
import 'package:tour_mate/features/search/search_screen.dart';
import 'package:tour_mate/utils/palette.dart';

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
        children:  [
          HomeScreen(),
          ScheduleScreen(),
          SearchScreen(),
          ItenaryScreen(),
          MapScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Palette.primary,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
            pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/home.svg',
              color: index == 0 ? Palette.primary : Colors.black54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/calendar.svg',
              color: index == 1 ? Palette.primary : Colors.black54,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/home.svg',
              color: index == 2 ? Palette.primary : Colors.black54,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/chat.svg',
              color: index == 3 ? Palette.primary : Colors.black54,
            ),
            label: 'Itenary',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/explore.svg',
              color: index == 4 ? Palette.primary : Colors.black54,
            ),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
