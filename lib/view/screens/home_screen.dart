import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakdi_pay_user/utils/app_images.dart';
import 'package:nakdi_pay_user/view/screens/home/homepage.dart';
import 'package:nakdi_pay_user/view/screens/insights/insights.dart';
import 'package:nakdi_pay_user/view/screens/notification/notifcation.dart';
import 'package:nakdi_pay_user/view/screens/scan/qr_screen.dart';
import 'package:nakdi_pay_user/view/screens/scan/scan.dart';

import '../../utils/app_colors.dart';
import '../widgets/scroll_to_hide_widget.dart';

ScrollController controller = ScrollController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = <Widget>[
    HomePage(scroll: controller),
    Notifications(),
    Insights(scroll: controller),
    QRViewExample()
  ];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        child: BottomNavigationBar(
          backgroundColor: AppColors.navbgColor,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          showUnselectedLabels: true, // new
          //
          // selectedIconTheme:
          //     IconThemeData(color: AppColors.primaryColor, size: 26),
          unselectedIconTheme:
              const IconThemeData(color: AppColors.iconGreyColor, size: 20),
          unselectedItemColor: AppColors.iconGreyColor,
          selectedItemColor: AppColors.primaryColor,

          items: [
            showBottomNavBar(AppImages.activeHomeBottomIcon,
                AppImages.homeBottomIcon, 'Home'),
            showBottomNavBar(AppImages.activeNotificationsBottomIcon,
                AppImages.notificationsBottomIcon, 'Notifications'),
            showBottomNavBar(AppImages.activeInsightsBottomIcon,
                AppImages.insightsBottomIcon, 'Insights'),
            showBottomNavBar(AppImages.activeScanBottomIcon,
                AppImages.scanBottomIcon, 'Scan'),
          ],
        ),
      ),
    );
  }

  showBottomNavBar(String activeIcon, String unActiveIcon, String labelText) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        activeIcon,
      ),
      icon: SvgPicture.asset(
        unActiveIcon,
      ),
      label: labelText,
    );
  }
}
