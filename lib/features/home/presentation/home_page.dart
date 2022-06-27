import 'package:flutter/cupertino.dart';
import 'package:valorant_pocket_guide/core/design/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.mainRedishColor,
        middle: Image(
          image: AssetImage("assets/images/V_Lockup_Vertical_Navy.png"),
        ),
        trailing: Icon(
          CupertinoIcons.info,
          color: AppColors.jetBlack,
        ),
      ),
      child: Container(),
    );
  }
}
