import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:valorant_pocket_guide/core/features/home/data/data_source/call_agents_list_data_source.dart';
import 'package:valorant_pocket_guide/core/features/home/home_module.dart';

void main() {
group("Api Call Agents List Test", () {
  initModule(HomeModule(), replaceBinds: [Bind.instance<CallAgentsListDataSource>(ApiCallAgentsListDataSource())]);
});  
}