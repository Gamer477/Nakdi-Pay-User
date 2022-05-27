import 'package:flutter/material.dart';
import 'package:nakdi_pay_user/utils/app_colors.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          color: AppColors.blueColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(),
        )
      ]),
    );
  }
}
