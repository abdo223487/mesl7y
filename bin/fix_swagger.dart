import 'dart:io';
import 'dart:convert';

void main() {
  final file = File('apispec.json');
  final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  final paths = json['paths'] as Map<String, dynamic>;

  for (final entry in paths.entries) {
    final pathObj = entry.value as Map<String, dynamic>;
    final methodObj = pathObj['get'] ?? pathObj['post'] ?? pathObj['put'] ?? pathObj['delete'];
    if (methodObj == null) continue;

    final parameters = (methodObj['parameters'] as List? ?? [])
        .where((p) => p['in'] != 'path')
        .toList();

    final properties = <String, dynamic>{};
    final required = <String>[];

    for (final param in parameters) {
      final name = param['name'] as String;
      properties[name] = {'type': param['schema']?['type'] ?? 'string'};
      if (param['required'] == true) required.add(name);
    }

    methodObj['parameters'] = (methodObj['parameters'] as List? ?? [])
        .where((p) => p['in'] == 'path')
        .toList();

    if (properties.isNotEmpty) {
      methodObj['requestBody'] = {
        'required': true,
        'content': {
          'application/json': {
            'schema': {
              'type': 'object',
              'properties': properties,
              if (required.isNotEmpty) 'required': required,
            },
          },
        },
      };
    }

    pathObj.remove('get');
    pathObj.remove('put');
    pathObj.remove('delete');
    pathObj['post'] = methodObj;

    print('✅ Fixed ${entry.key} → POST + body');
  }

  final output = const JsonEncoder.withIndent('  ').convert(json);
  
  // ✅ احفظ في root
  file.writeAsStringSync(output);
  
  // ✅ انسخ لـ web
  File('web/apispec.json').writeAsStringSync(output);

  print('\n🎉 Done!');
}
