import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/generics/resource.dart';
import 'package:valorant_pocket_guide/features/home/data/api_call_error.dart';
import 'package:valorant_pocket_guide/features/home/data/data_source/call_agents_list_data_source.dart';
import 'package:valorant_pocket_guide/features/home/domain/entities/agents_entity.dart';

abstract class AgentsListRepository {
  Future<Resource<AgentEntity, ApiCallError>> returnAgentsList();
}

class DefaultAgentsListCall implements AgentsListRepository {
  final _dataSource = Modular.get<CallAgentsListDataSource>();

  @override
  Future<Resource<AgentEntity, ApiCallError>> returnAgentsList() async {
    final resource = await _dataSource.returnAgentsList();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final agentsMap = resource.data;
    final agentsEntity = AgentEntity.fromJson(agentsMap!);
    return Resource.success(data: agentsEntity);
  }
}
