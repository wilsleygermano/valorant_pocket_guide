// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$agentsDataAtom =
      Atom(name: '_HomePageControllerBase.agentsData', context: context);

  @override
  List<AgentData> get agentsData {
    _$agentsDataAtom.reportRead();
    return super.agentsData;
  }

  @override
  set agentsData(List<AgentData> value) {
    _$agentsDataAtom.reportWrite(value, super.agentsData, () {
      super.agentsData = value;
    });
  }

  late final _$fetchAgentsListAsyncAction =
      AsyncAction('_HomePageControllerBase.fetchAgentsList', context: context);

  @override
  Future<Resource<List<AgentData>, ApiCallError>> fetchAgentsList() {
    return _$fetchAgentsListAsyncAction.run(() => super.fetchAgentsList());
  }

  @override
  String toString() {
    return '''
agentsData: ${agentsData}
    ''';
  }
}
