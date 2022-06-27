import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/features/home/data/data_source/call_agents_list_data_source.dart';
import 'package:valorant_pocket_guide/core/features/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<CallAgentsListDataSource>((i) => ApiCallAgentsListDataSource()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const MyHomePage())
      ];
}
