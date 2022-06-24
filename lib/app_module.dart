import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/adapters/remote_client.dart';
import 'package:valorant_pocket_guide/core/features/home/home_module.dart';
import 'package:valorant_pocket_guide/core/features/home/presentation/home_page.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    Bind<RemoteClient>((i) => DioRemoteClient(), isSingleton: false,)
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: HomeModule(),)
  ];
  
}