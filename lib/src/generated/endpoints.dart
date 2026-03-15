/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/azkar_endpoint.dart' as _i3;
import '../endpoints/chat_endpoint.dart' as _i4;
import '../endpoints/fatwa_endpoint.dart' as _i5;
import '../endpoints/material_endpoint.dart' as _i6;
import '../endpoints/nabi_endpoint.dart' as _i7;
import '../endpoints/sira_endpoint.dart' as _i8;
import '../greeting_endpoint.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'azkar': _i3.AzkarEndpoint()
        ..initialize(
          server,
          'azkar',
          null,
        ),
      'chat': _i4.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          null,
        ),
      'fatwa': _i5.FatwaEndpoint()
        ..initialize(
          server,
          'fatwa',
          null,
        ),
      'material': _i6.MaterialEndpoint()
        ..initialize(
          server,
          'material',
          null,
        ),
      'nabi': _i7.NabiEndpoint()
        ..initialize(
          server,
          'nabi',
          null,
        ),
      'sira': _i8.SiraEndpoint()
        ..initialize(
          server,
          'sira',
          null,
        ),
      'greeting': _i9.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).register(
            session,
            params['email'],
            params['password'],
            params['name'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).login(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'refresh': _i1.MethodConnector(
          name: 'refresh',
          params: {
            'refreshTokenStr': _i1.ParameterDescription(
              name: 'refreshTokenStr',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).refresh(
            session,
            params['refreshTokenStr'],
          ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {
            'refreshTokenStr': _i1.ParameterDescription(
              name: 'refreshTokenStr',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).logout(
            session,
            params['refreshTokenStr'],
          ),
        ),
        'logoutAll': _i1.MethodConnector(
          name: 'logoutAll',
          params: {
            'refreshTokenStr': _i1.ParameterDescription(
              name: 'refreshTokenStr',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).logoutAll(
            session,
            params['refreshTokenStr'],
          ),
        ),
        'me': _i1.MethodConnector(
          name: 'me',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).me(session),
        ),
        'changePassword': _i1.MethodConnector(
          name: 'changePassword',
          params: {
            'oldPassword': _i1.ParameterDescription(
              name: 'oldPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).changePassword(
            session,
            params['oldPassword'],
            params['newPassword'],
          ),
        ),
      },
    );
    connectors['azkar'] = _i1.EndpointConnector(
      name: 'azkar',
      endpoint: endpoints['azkar']!,
      methodConnectors: {
        'getAzkar': _i1.MethodConnector(
          name: 'getAzkar',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['azkar'] as _i3.AzkarEndpoint).getAzkar(
            session,
            params['category'],
          ),
        ),
        'addAzkar': _i1.MethodConnector(
          name: 'addAzkar',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'arabicText': _i1.ParameterDescription(
              name: 'arabicText',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'repeat': _i1.ParameterDescription(
              name: 'repeat',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderIndex': _i1.ParameterDescription(
              name: 'orderIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['azkar'] as _i3.AzkarEndpoint).addAzkar(
            session,
            params['category'],
            params['arabicText'],
            params['repeat'],
            params['orderIndex'],
          ),
        ),
        'updateAzkar': _i1.MethodConnector(
          name: 'updateAzkar',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'arabicText': _i1.ParameterDescription(
              name: 'arabicText',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'repeat': _i1.ParameterDescription(
              name: 'repeat',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['azkar'] as _i3.AzkarEndpoint).updateAzkar(
            session,
            params['id'],
            arabicText: params['arabicText'],
            repeat: params['repeat'],
          ),
        ),
        'deleteAzkar': _i1.MethodConnector(
          name: 'deleteAzkar',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['azkar'] as _i3.AzkarEndpoint).deleteAzkar(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
      methodConnectors: {
        'requestChat': _i1.MethodConnector(
          name: 'requestChat',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).requestChat(session),
        ),
        'acceptChat': _i1.MethodConnector(
          name: 'acceptChat',
          params: {
            'conversationId': _i1.ParameterDescription(
              name: 'conversationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).acceptChat(
            session,
            params['conversationId'],
          ),
        ),
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'conversationId': _i1.ParameterDescription(
              name: 'conversationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).sendMessage(
            session,
            params['conversationId'],
            params['message'],
          ),
        ),
        'getMessages': _i1.MethodConnector(
          name: 'getMessages',
          params: {
            'conversationId': _i1.ParameterDescription(
              name: 'conversationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).getMessages(
            session,
            params['conversationId'],
          ),
        ),
        'getPendingChats': _i1.MethodConnector(
          name: 'getPendingChats',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).getPendingChats(session),
        ),
        'getMyActiveChats': _i1.MethodConnector(
          name: 'getMyActiveChats',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).getMyActiveChats(session),
        ),
        'getMyChats': _i1.MethodConnector(
          name: 'getMyChats',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i4.ChatEndpoint).getMyChats(session),
        ),
      },
    );
    connectors['fatwa'] = _i1.EndpointConnector(
      name: 'fatwa',
      endpoint: endpoints['fatwa']!,
      methodConnectors: {
        'addFatwa': _i1.MethodConnector(
          name: 'addFatwa',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fatwa'] as _i5.FatwaEndpoint).addFatwa(
            session,
            params['title'],
            params['content'],
          ),
        ),
        'getFatwas': _i1.MethodConnector(
          name: 'getFatwas',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fatwa'] as _i5.FatwaEndpoint).getFatwas(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'updateFatwa': _i1.MethodConnector(
          name: 'updateFatwa',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fatwa'] as _i5.FatwaEndpoint).updateFatwa(
            session,
            params['id'],
            title: params['title'],
            content: params['content'],
          ),
        ),
        'deleteFatwa': _i1.MethodConnector(
          name: 'deleteFatwa',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fatwa'] as _i5.FatwaEndpoint).deleteFatwa(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['material'] = _i1.EndpointConnector(
      name: 'material',
      endpoint: endpoints['material']!,
      methodConnectors: {
        'uploadMaterial': _i1.MethodConnector(
          name: 'uploadMaterial',
          params: {
            'yearName': _i1.ParameterDescription(
              name: 'yearName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'materialName': _i1.ParameterDescription(
              name: 'materialName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileUrl': _i1.ParameterDescription(
              name: 'fileUrl',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileType': _i1.ParameterDescription(
              name: 'fileType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint).uploadMaterial(
            session,
            yearName: params['yearName'],
            materialName: params['materialName'],
            fileUrl: params['fileUrl'],
            fileType: params['fileType'],
          ),
        ),
        'getAllMaterials': _i1.MethodConnector(
          name: 'getAllMaterials',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint)
                  .getAllMaterials(session),
        ),
        'getMaterialsByYear': _i1.MethodConnector(
          name: 'getMaterialsByYear',
          params: {
            'yearName': _i1.ParameterDescription(
              name: 'yearName',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint)
                  .getMaterialsByYear(
            session,
            params['yearName'],
          ),
        ),
        'getMaterialsByName': _i1.MethodConnector(
          name: 'getMaterialsByName',
          params: {
            'materialName': _i1.ParameterDescription(
              name: 'materialName',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint)
                  .getMaterialsByName(
            session,
            params['materialName'],
          ),
        ),
        'deleteMaterial': _i1.MethodConnector(
          name: 'deleteMaterial',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint).deleteMaterial(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['nabi'] = _i1.EndpointConnector(
      name: 'nabi',
      endpoint: endpoints['nabi']!,
      methodConnectors: {
        'addNabi': _i1.MethodConnector(
          name: 'addNabi',
          params: {
            'nabiContents': _i1.ParameterDescription(
              name: 'nabiContents',
              type: _i1.getType<List<String>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nabi'] as _i7.NabiEndpoint).addNabi(
            session,
            params['nabiContents'],
          ),
        ),
        'updateNabi': _i1.MethodConnector(
          name: 'updateNabi',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nabi'] as _i7.NabiEndpoint).updateNabi(
            session,
            params['id'],
            content: params['content'],
          ),
        ),
        'deleteNabi': _i1.MethodConnector(
          name: 'deleteNabi',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nabi'] as _i7.NabiEndpoint).deleteNabi(
            session,
            params['id'],
          ),
        ),
        'getAllNabi': _i1.MethodConnector(
          name: 'getAllNabi',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nabi'] as _i7.NabiEndpoint).getAllNabi(session),
        ),
      },
    );
    connectors['sira'] = _i1.EndpointConnector(
      name: 'sira',
      endpoint: endpoints['sira']!,
      methodConnectors: {
        'addSira': _i1.MethodConnector(
          name: 'addSira',
          params: {
            'siraContents': _i1.ParameterDescription(
              name: 'siraContents',
              type: _i1.getType<List<String>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sira'] as _i8.SiraEndpoint).addSira(
            session,
            params['siraContents'],
          ),
        ),
        'updateSira': _i1.MethodConnector(
          name: 'updateSira',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sira'] as _i8.SiraEndpoint).updateSira(
            session,
            params['id'],
            content: params['content'],
          ),
        ),
        'deleteSira': _i1.MethodConnector(
          name: 'deleteSira',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sira'] as _i8.SiraEndpoint).deleteSira(
            session,
            params['id'],
          ),
        ),
        'getAllSira': _i1.MethodConnector(
          name: 'getAllSira',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sira'] as _i8.SiraEndpoint).getAllSira(session),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i9.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
