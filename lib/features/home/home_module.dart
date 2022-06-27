import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/features/home/data/repositories/agents_list_repository.dart';
import 'package:valorant_pocket_guide/features/home/domain/use_case/api_call_use_case.dart';
import 'package:valorant_pocket_guide/features/home/presentation/controller/home_page_controller.dart';
import 'data/data_source/call_agents_list_data_source.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<CallAgentsListDataSource>((i) => ApiCallAgentsListDataSource()),
        Bind<AgentsListRepository>((i) => DefaultAgentsListCall()),
        Bind<ApiCallUseCase>((i) => DefaultApiCallUseCase()),
        Bind<HomePageController>((i) => HomePageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const MyHomePage())
      ];
}
