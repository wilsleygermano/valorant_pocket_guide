import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:valorant_pocket_guide/core/design/app_colors.dart';
import 'package:valorant_pocket_guide/features/home/data/api_call_error.dart';
import 'package:valorant_pocket_guide/features/home/domain/entities/agents_entity.dart';
import 'package:valorant_pocket_guide/features/home/domain/use_case/api_call_use_case.dart';

import '../../../../core/generics/resource.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final _useCase = Modular.get<ApiCallUseCase>();

  
  @observable
  List<AgentData> agentsData = [];

  
  @action
  Future<List<AgentData>> fetchAgentsList() async {
    final resource = await _useCase.returnAgentsListValues();

    if (resource.hasError) {
      Center(
        child: Text("${ApiCallError.apiError}"),
      );
    }

    if (resource.status == Status.loading) {
      const Center(
        child: CupertinoActivityIndicator(
          color: AppColors.mainRedishDarkerColor,
        ),
      );
    }
    agentsData = resource.data!.data!;

    return agentsData;
  }
}
