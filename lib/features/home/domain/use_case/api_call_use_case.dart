import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/generics/resource.dart';
import 'package:valorant_pocket_guide/features/home/data/api_call_error.dart';
import 'package:valorant_pocket_guide/features/home/data/repositories/agents_list_repository.dart';
import 'package:valorant_pocket_guide/features/home/domain/entities/agents_entity.dart';

abstract class ApiCallUseCase {
  Future<Resource<AgentEntity, ApiCallError>> returnAgentsListValues();
}

class DefaultApiCallUseCase implements ApiCallUseCase {
  @override
  Future<Resource<AgentEntity, ApiCallError>> returnAgentsListValues() async {
    final _repository = Modular.get<DefaultAgentsListCall>();

    final resource = await _repository.returnAgentsList();

    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    return Resource.success(data: resource.data);
  }
}
