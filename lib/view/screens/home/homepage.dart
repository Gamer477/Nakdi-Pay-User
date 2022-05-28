import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakdi_pay_user/utils/app_images.dart';
import 'package:sizer/sizer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/content.dart';

class HomePage extends StatefulWidget {
  ScrollController? scroll;
  HomePage({
    Key? key,
    this.scroll,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Map<String, String>> datam = [
    {"name": 'Amr', "image": "assets/images/amr.png"},
    {"name": 'Maryam', "image": "assets/images/maryem.png"},
    {"name": 'Abdelrah', "image": "assets/images/abdelrah.png"},
    {"name": 'youssef', "image": "assets/images/youssef.png"},
    {"name": 'Work', "image": "assets/images/work_image.png"},
    {"name": 'Collage', "image": "assets/images/work_image.png"},
    {"name": 'Fatma', "image": "assets/images/fatma.png"}
  ];
  List<Map<String, String>> bussinesAndBills = [
    {"name": 'M C', "image": "assets/images/mac.png"},
    {"name": 'S.Bucks', "image": "assets/images/s_bucks.png"},
    {"name": 'Cola', "image": "assets/images/cola.png"},
    {"name": 'Spotify', "image": "assets/images/spotify.png"},
    {"name": 'Netflix', "image": "assets/images/netfilix.png"},
    {"name": 'Nike', "image": "assets/images/nike.png"},
    {"name": 'Amr', "image": "assets/images/amr_adidas.png"}
  ];
  List<Map<String, String>> promotions = [
    {"name": 'Rewards', "image": "assets/images/rewards.png"},
    {"name": 'Rewards', "image": "assets/images/rewards2.png"},
    {"name": 'Refferals', "image": "assets/images/refferals.png"},
  ];
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: widget.scroll,
            child: Container(
              color: const Color(0xffF0F0F0),
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Center(
                        child: Container(
                          width: 15.w,
                          height: 0.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Content(
                        title: "People",
                        data: datam,
                      ),
                      Content(
                        title: "Bussines & Bills",
                        data: bussinesAndBills,
                      ),
                      Content(
                        title: "Promotions",
                        data: promotions,
                      ),
                      SizedBox(
                        width: 90.w,
                        height: 14.h,
                        child: Card(
                          color: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: SvgPicture.asset(AppImages.clockIcon),
                                trailing: const Icon(Icons.arrow_forward_ios,
                                    size: 15),
                                title: Text(
                                  "See all payment activity",
                                  style: TextStyle(
                                    fontFamily: "Inter-Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: SvgPicture.asset(AppImages.bankIcon),
                                trailing: const Icon(Icons.arrow_forward_ios,
                                    size: 15),
                                title: Text(
                                  "Check account balance",
                                  style: TextStyle(
                                    fontFamily: "Inter-Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 1.h,
            left: 33.w,
            child: Container(
              width: 35.w,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff2B388F),
                    Color(0xff4557D0),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'New Payment',
                  style: TextStyle(
                    fontFamily: "Inter-Regular",
                    fontSize: 10.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
