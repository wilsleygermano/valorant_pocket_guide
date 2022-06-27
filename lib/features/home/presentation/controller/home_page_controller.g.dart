// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$agentNameAtom =
      Atom(name: '_HomePageControllerBase.agentName', context: context);

  @override
  String get agentName {
    _$agentNameAtom.reportRead();
    return super.agentName;
  }

  @override
  set agentName(String value) {
    _$agentNameAtom.reportWrite(value, super.agentName, () {
      super.agentName = value;
    });
  }

  late final _$agentsListAtom =
      Atom(name: '_HomePageControllerBase.agentsList', context: context);

  @override
  ObservableList<AgentData> get agentsList {
    _$agentsListAtom.reportRead();
    return super.agentsList;
  }

  @override
  set agentsList(ObservableList<AgentData> value) {
    _$agentsListAtom.reportWrite(value, super.agentsList, () {
      super.agentsList = value;
    });
  }

  late final _$fetchAgentsListAsyncAction =
      AsyncAction('_HomePageControllerBase.fetchAgentsList', context: context);

  @override
  Future<ObservableList<AgentData>> fetchAgentsList() {
    return _$fetchAgentsListAsyncAction.run(() => super.fetchAgentsList());
  }

  @override
  String toString() {
    return '''
agentName: ${agentName},
agentsList: ${agentsList}
    ''';
  }
}
