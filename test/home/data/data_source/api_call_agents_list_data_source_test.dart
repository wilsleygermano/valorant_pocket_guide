import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:valorant_pocket_guide/app_module.dart';
import 'package:valorant_pocket_guide/core/adapters/remote_client.dart';
import 'package:valorant_pocket_guide/core/adapters/remote_client_error.dart';
import 'package:valorant_pocket_guide/core/features/home/data/data_source/call_agents_list_data_source.dart';
import 'package:valorant_pocket_guide/core/generics/api_response.dart';
import 'package:valorant_pocket_guide/core/generics/resource.dart';

void main() {
  // intancio uma classe "fake" para teste (criada ao fim do documento)
  final stub = RemoteClientStub();

  group(
    "Api Call Agents List Test",
    () {
      // injeção criada pelo modular
      initModule(
        AppModule(),
        replaceBinds: [Bind.instance<RemoteClient>(stub)],
      );

      // unidade que desejo testar
      final testingUnit = ApiCallAgentsListDataSource();

      test(
        "When statusCode != 200 then should return an error",
        () async {
          stub.apiResponseToUse = ApiResponse(statusCode: 400);
          final result = await testingUnit.returnAgentsList();
          expect(result.error, isNot(null));
          expect(result.data, isNull);
          expect(result.status, Status.failed);
        },
      );
      test(
        "When statusCode == 200 then should return an error",
        () async {
          stub.apiResponseToUse =
              ApiResponse(statusCode: 200, data: {'data': 'data'});
          final result = await testingUnit.returnAgentsList();
          expect(result.data, isNot(null));
          expect(result.error, isNull);
          expect(result.status, Status.success);
        },
      );
    },
  );
}

// "mocko" uma classe que já existe para tentar obter sus hipóteses, implementando uma
// classe que já existe.
class RemoteClientStub implements RemoteClient {
  // crio uma variável que se retorna o tipo esperado pela função a ser testada.
  ApiResponse<Map<String, dynamic>, RemoteClientError>? apiResponseToUse;

  @override
  Future<ApiResponse<Map<String, dynamic>, RemoteClientError>> get(
      String url) async {
        // aqui passo a variável acima criada.
    return apiResponseToUse!;
  }
}
