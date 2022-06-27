import 'package:flutter/cupertino.dart';
import 'package:valorant_pocket_guide/core/design/app_colors.dart';

import 'features/home/presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.navalBlue,
        primaryColor: AppColors.mainRedishColor,
      ),
      home: MyHomePage(),
    );
  }
}