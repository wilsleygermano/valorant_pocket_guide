import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_pocket_guide/core/adapters/remote_client.dart';
import 'package:valorant_pocket_guide/core/constants/api_routes.dart';
import 'package:valorant_pocket_guide/core/generics/resource.dart';

import '../api_call_error.dart';

abstract class CallAgentsListDataSource {
  Future<Resource<Map<String, dynamic>, ApiCallError>> returnAgentsList();
}

class ApiCallAgentsListDataSource implements CallAgentsListDataSource {
  final _remoteClient = Modular.get<RemoteClient>();

  @override
  Future<Resource<Map<String, dynamic>, ApiCallError>>
      returnAgentsList() async {
    final response = await _remoteClient.get(ApiRoutes.agentsApiListCall);

    if (response.statusCode != 200) {
      return Resource.failed(error: ApiCallError.unknown);
    }
    if (response.statusCode == 500) {
      return Resource.failed(error: ApiCallError.dioError);
    }
    if (response.statusCode == 400) {
      return Resource.failed(error: ApiCallError.badRequest);
    }
    return Resource.success(data: response.data);
  }
}
