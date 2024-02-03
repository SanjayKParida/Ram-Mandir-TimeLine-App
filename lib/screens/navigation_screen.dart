import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';
import 'package:ram_mandir_timeline/screens/audio_screen.dart';
import 'package:ram_mandir_timeline/screens/timeline_screen.dart';

import '../controller/bottom_navigation.dart';
import 'about_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //BOTTOM NAVIGATION BAR CONTROLLER
    BottomNavBarController bottomNavBarController =
        Get.put(BottomNavBarController());

    //LIST OF DIFFERENT PAGES
    final screens = [
      const TimelineScreen(),
      const AudioScreen(),
      const AboutScreen()
    ];

    return Scaffold(
        body: Obx(() => IndexedStack(
            index: bottomNavBarController.selectedIndex.value,
            children: screens)),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: CustomColors.primaryColor,
            unselectedItemColor: Colors.grey.shade600,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              bottomNavBarController.changeIndex(index);
            },
            currentIndex: bottomNavBarController.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.calendar,
                  ),
                  label: 'Timeline'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBold.volume_up,
                  ),
                  label: 'Bhajan'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBold.info_square,
                  ),
                  label: 'About'),
            ],
          ),
        ));
  }
}
