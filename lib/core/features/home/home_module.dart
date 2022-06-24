import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/features/home/presentation/home_page.dart';

class HomeModule extends Module {
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) =>  const MyHomePage())
  ];

}