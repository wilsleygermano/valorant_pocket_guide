// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:modular_test/modular_test.dart';
// import 'package:valorant_pocket_guide/app_module.dart';
// import 'package:valorant_pocket_guide/core/adapters/remote_client.dart';
// import 'package:valorant_pocket_guide/core/adapters/remote_client_error.dart';
// import 'package:valorant_pocket_guide/core/generics/api_response.dart';
// import 'package:valorant_pocket_guide/core/generics/resource.dart';
// import 'package:valorant_pocket_guide/features/home/data/api_call_error.dart';
// import 'package:valorant_pocket_guide/features/home/data/repositories/agents_list_repository.dart';
// import 'package:valorant_pocket_guide/features/home/domain/entities/agents_entity.dart';
// import 'package:valorant_pocket_guide/features/home/domain/use_case/api_call_use_case.dart';
// import 'package:valorant_pocket_guide/features/home/home_module.dart';

// void main() {
//   // intancio uma classe "fake" para teste (criada ao fim do documento)
//   final stub = DefaultAgentsListCallStub();
//   final stub2 = RemoteClientStub();

//   group(
//     "Api Call Agents List Test",
//     () {
//       // injeção criada pelo modular
//       initModule(
        
//         HomeModule(),
//         replaceBinds: [Bind.instance<DefaultAgentsListCall>(stub)],
        
//       );

//       initModule(
//         AppModule(),
//         replaceBinds: [Bind.instance<RemoteClient>(stub2)],
//       );

//       // unidade que desejo testar
//       final testingUnit = DefaultApiCallUseCase();

//       test(
//         "When statusCode != 200 then should return an error",
//         () async {
//         stub.apiResponseToUse = Resource.failed();
//           final result = await testingUnit.returnAgentsListValues();
//           expect(result.error, isNot(null));
//           expect(result.data, isNull);
//           expect(result.status, Status.failed);
//         },
//       );
//       test(
//         "When statusCode == 200 then should return my data",
//         () async {
//         stub.apiResponseToUse = Resource.success();
//           final result = await testingUnit.returnAgentsListValues();
//           expect(result.data, isNot(null));
//           expect(result.error, isNull);
//           expect(result.status, Status.success);
//         },
//       );
//     },
//   );
// }

// // "mocko" uma classe que já existe para tentar obter sus hipóteses, implementando uma
// // classe que já existe.
// class DefaultAgentsListCallStub implements DefaultAgentsListCall {
//   // crio uma variável que se retorna o tipo esperado pela função a ser testada.
//   Resource<AgentEntity, ApiCallError>? apiResponseToUse;

//   @override
//   Future<Resource<AgentEntity, ApiCallError>> returnAgentsList() async {
//     return apiResponseToUse!;
//   }
// }

// class RemoteClientStub implements RemoteClient {
//   // crio uma variável que se retorna o tipo esperado pela função a ser testada.
//   ApiResponse<Map<String, dynamic>, RemoteClientError>? apiResponseToUse;

//   @override
//   Future<ApiResponse<Map<String, dynamic>, RemoteClientError>> get(
//       String url) async {
//         // aqui passo a variável acima criada.
//     return apiResponseToUse!;
//   }
// }