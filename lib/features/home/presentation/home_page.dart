import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:valorant_pocket_guide/core/design/app_colors.dart';
import 'package:valorant_pocket_guide/features/home/presentation/controller/home_page_controller.dart';
import 'package:valorant_pocket_guide/features/home/widgets/agent_card.dart';
import 'package:valorant_pocket_guide/features/home/widgets/agent_modal_sheet.dart';

import '../../../core/widgets/glassmorphism.dart';

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
          return GridView.builder(
            itemCount: _controller.agentsData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return AgentCard(
                  agentAvatarUrl:
                      _controller.agentsData[index].displayIconSmall!,
                  agentName: _controller.agentsData[index].displayName!,
                  onTapAction: () {
                    showCupertinoModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return CupertinoPopupSurface(
                          child: Container(
                            color: AppColors.navalBlue,
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      image: NetworkImage(
                                        _controller
                                            .agentsData[index].bustPortrait!,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BorderedText(
                                      strokeWidth: 3.0,
                                      strokeColor: AppColors.babyPowder,
                                      child: Text(
                                        _controller
                                            .agentsData[index].displayName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: AppColors.navalBlue,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _controller
                                      .agentsData[index].abilities!.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          image: NetworkImage(
                                           _controller.agentsData[index]
                                              .abilities![index].displayIcon!,
                                          ),
                                        ),
                                        Text(
                                          _controller.agentsData[index]
                                              .abilities![index].displayName!,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
            },
          );
        }),
      ),
    );
  }
}
