import 'package:flutter/material.dart';
import 'package:nakdi_pay_user/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class Content extends StatefulWidget {
  String? title;
  Content({this.title});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List<Map<String, String>> data = [
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
    return SizedBox(
      width: 90.w,
      height: 30.h,
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 18, top: 15, bottom: 20),
              child: Text(
                "${widget.title}",
                style: TextStyle(
                  fontFamily: 'Inter-SemiBold',
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                ),
                padding: EdgeInsets.only(left: 10, right: 4),
                itemCount: data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    //alignment: Alignment.center,
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(data[index]["image"]!)),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          data[index]["name"]!,
                          style: TextStyle(
                            fontFamily: 'Inter-Regular',
                            color: AppColors.blackColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
