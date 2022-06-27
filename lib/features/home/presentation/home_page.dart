import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/design/app_colors.dart';
import 'package:valorant_pocket_guide/features/home/presentation/controller/home_page_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = Modular.get<HomePageController>();

  @override
  void initState() {
    _controller.fetchAgentsList();
    super.initState();
  }

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
      child: Center(
        child: Observer(builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.agentsData.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: NetworkImage(_controller.agentsData[index].displayIconSmall!), height: 100, width: 100,),
                    Text(_controller.agentsData[index].displayName!)
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
