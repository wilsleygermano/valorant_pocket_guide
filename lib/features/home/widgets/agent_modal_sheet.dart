import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AgentModalSheet extends StatelessWidget {
  final String agentBustImage;
  final int itemCount;
  final String imageUrl;
  final String testTextData;

  const AgentModalSheet(
      {Key? key,
      required this.agentBustImage,
      required this.itemCount,
      required this.imageUrl,
      required this.testTextData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(),
      physics: ScrollPhysics(parent: PageScrollPhysics()),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(agentBustImage),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: ListView.builder(
        shrinkWrap: true,
         controller: ModalScrollController.of(context),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
           
                    ],
                  ),
                  Flexible(
                    child: Text(testTextData, style: TextStyle(
                      overflow: TextOverflow.visible
                    ),),
                  )
                ],
              ),
            ],
          );
        },
        itemCount: itemCount,
      ),
    );
  }
}
