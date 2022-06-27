import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/adapters/remote_client.dart';

import 'features/home/home_module.dart';


class AppModule extends Module {

  @override
  List<Bind> get binds => [
    Bind<RemoteClient>((i) => DioRemoteClient(),)

    
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: HomeModule(),)
  ];
  
}