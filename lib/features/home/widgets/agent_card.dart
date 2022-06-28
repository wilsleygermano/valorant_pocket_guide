import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../../core/design/app_colors.dart';
import '../../../core/widgets/glassmorphism.dart';

class AgentCard extends StatelessWidget {
  final String agentAvatarUrl;
  final String agentName;
  final Function onTapAction;

  const AgentCard(
      {Key? key,
      required this.agentAvatarUrl,
      required this.agentName,
      required this.onTapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassMorphism(
        borderRadius: 5,
        start: 0.4,
        end: 0.1,
        child: GestureDetector(
          onTap: () {
            onTapAction;
          },
          child: Card(
            elevation: 0,
            color: AppColors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(agentAvatarUrl), fit: BoxFit.cover),
                  ),
                ),
                BorderedText(
                  strokeWidth: 3.0,
                  strokeColor: AppColors.babyPowder,
                  child: Text(
                    agentName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.navalBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
