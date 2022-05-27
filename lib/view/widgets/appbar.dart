import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakdi_pay_user/utils/app_colors.dart';
import 'package:nakdi_pay_user/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? accountValue;
  bool isSelected = false;
  var accountItems = [
    'CIB Account',
    'QNB Account',
    'NBA Account ',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          print("Profile Screen");
        },
        child: Image.asset(
          AppImages.profileImg,
        ),
      ),
      title: Row(
        children: [
          SizedBox(
            height: 30,
            child: VerticalDivider(
              thickness: 2,
              width: 10,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 3.0.w,
          ),
          Image.asset(
            AppImages.masterCardImg,
          ),
          DropdownButton(
            dropdownColor: AppColors.primaryColor, focusColor: Colors.red,
            elevation: 0,
            underline: SizedBox(),
            hint: Container(
              width: 25.0.w,
              child: Text(
                "Bank Account",
                style: TextStyle(
                  fontFamily: 'Inter-Regular',
                  color: AppColors.whiteColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Initial Value
            value: accountValue,
            // Down Arrow Icon
            icon: SvgPicture.asset(
              AppImages.dropDownIcon,
            ),
            alignment: Alignment.center,
            // Array list of items
            items: accountItems.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style:
                      //isSelected ?
                      TextStyle(
                    fontFamily: 'Inter-Regular',
                    color: AppColors.whiteColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  // : TextStyle(
                  //     fontFamily: 'Inter-Regular',
                  //     color: AppColors.greyColor,
                  //     fontSize: 10.sp,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
            // onTap: () {
            //   setState(() {});
            // },
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                //  isSelected = true;
                print("New Val accountValue $newValue");
                accountValue = newValue!;
              });
              //   isSelected = false;
            },
          ),
        ],
      ),
      titleSpacing: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2B388F),
              Color(0xff4557D0),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print("Search Page");
          },
          icon: SvgPicture.asset(AppImages.searchIcon),
        ),
        IconButton(
          onPressed: () {
            print("Scan Page");
          },
          icon: SvgPicture.asset(AppImages.scanIcon),
        ),
      ],
    );
  }
}
