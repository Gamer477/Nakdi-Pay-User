import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nakdi_pay_user/utils/app_colors.dart';
import 'package:nakdi_pay_user/view/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  /// [navState] usage can be found in [notification_notifier.dart] file.
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil.setScreenSize(constraints, orientation);
            //SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
              navigatorKey: GlobalVariable.navState,
              title: 'Nakdi Pay',
              // navigatorObservers: [
              //   FirebaseAnalyticsObserver(analytics: analytics),
              // ],
              routes: <String, WidgetBuilder>{
                //"/Current_booking":(BuildContext context)=> new OfferPage(),
              },
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                cursorColor: AppColors.primaryColor,
              ),
              debugShowCheckedModeBanner: false,
              // themeMode:
              // theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
