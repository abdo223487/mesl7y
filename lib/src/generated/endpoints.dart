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
import '../endpoints/fatwa_endpoint.dart' as _i2;
import '../endpoints/nabi_endpoint.dart' as _i3;
import '../endpoints/sira_endpoint.dart' as _i4;
import '../greeting_endpoint.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'fatwa': _i2.FatwaEndpoint()
        ..initialize(
          server,
          'fatwa',
          null,
        ),
      'nabi': _i3.NabiEndpoint()
        ..initialize(
          server,
          'nabi',
          null,
        ),
      'sira': _i4.SiraEndpoint()
        ..initialize(
          server,
          'sira',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
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
              (endpoints['fatwa'] as _i2.FatwaEndpoint).addFatwa(
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
              (endpoints['fatwa'] as _i2.FatwaEndpoint).getFatwas(
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
              (endpoints['fatwa'] as _i2.FatwaEndpoint).updateFatwa(
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
              (endpoints['fatwa'] as _i2.FatwaEndpoint).deleteFatwa(
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
              (endpoints['nabi'] as _i3.NabiEndpoint).addNabi(
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
              (endpoints['nabi'] as _i3.NabiEndpoint).updateNabi(
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
              (endpoints['nabi'] as _i3.NabiEndpoint).deleteNabi(
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
              (endpoints['nabi'] as _i3.NabiEndpoint).getAllNabi(session),
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
              (endpoints['sira'] as _i4.SiraEndpoint).addSira(
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
              (endpoints['sira'] as _i4.SiraEndpoint).updateSira(
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
              (endpoints['sira'] as _i4.SiraEndpoint).deleteSira(
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
              (endpoints['sira'] as _i4.SiraEndpoint).getAllSira(session),
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
              (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
