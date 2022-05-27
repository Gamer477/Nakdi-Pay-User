import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakdi_pay_user/utils/app_images.dart';
import 'package:nakdi_pay_user/view/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../widgets/content.dart';
import '../widgets/scroll_to_hide_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  ScrollController controller = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Container(
          color: Color(0xffF0F0F0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.0.h,
              ),
              Center(
                child: Container(
                  width: 25.w,
                  height: 1.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Content(title: "People"),
              Content(title: "People"),
              Content(title: "People"),
              Content(title: "People"),
            ],
          ),
        ),
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
              IconThemeData(color: AppColors.iconGreyColor, size: 20),
          unselectedItemColor: AppColors.iconGreyColor,
          selectedItemColor: AppColors.primaryColor,

          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeHomeBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.homeBottomIcon,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeNotificationsBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.notificationsBottomIcon,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeInsightsBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.insightsBottomIcon,
              ),
              label: 'Insights',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.activeScanBottomIcon,
              ),
              icon: SvgPicture.asset(
                AppImages.scanBottomIcon,
              ),
              label: 'Scan',
            ),
          ],
        ),
      ),
    );
  }
}
