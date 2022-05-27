import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> datam = [
    {"name": 'Amr', "image": "assets/images/amr.png"},
    {"name": 'Maryam', "image": "assets/images/maryem.png"},
    {"name": 'Abdelrah', "image": "assets/images/abdelrah.png"},
    {"name": 'youssef', "image": "assets/images/youssef.png"},
    {"name": 'Work', "image": "assets/images/work_image.png"},
    {"name": 'Collage', "image": "assets/images/work_image.png"},
    {"name": 'Fatma', "image": "assets/images/fatma.png"}
  ];
  List<Map<String, String>> coffes = [
    {"name": 'Amr', "image": "assets/images/amr.png"},
    {"name": 'Maryam', "image": "assets/images/maryem.png"},
    {"name": 'Abdelrah', "image": "assets/images/abdelrah.png"},
    {"name": 'youssef', "image": "assets/images/youssef.png"},
    {"name": 'Work', "image": "assets/images/work_image.png"},
    {"name": 'Collage', "image": "assets/images/work_image.png"},
    {"name": 'Fatma', "image": "assets/images/fatma.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffF0F0F0),
          width: double.infinity,
          child: Column(
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
              Content(title: "People", data: datam),
              Content(
                title: "Bussines & Bills",
                data: coffes,
              ),
              // Content(title: "People"),
              // Content(title: "People"),

              // ياايايايااي
            ],
          ),
        ),
      ),
    );
  }
}
