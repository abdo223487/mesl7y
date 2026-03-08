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

    // ✅ كل الـ parameters من query لـ body
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

    // امسح الـ query parameters
    methodObj['parameters'] = (methodObj['parameters'] as List? ?? [])
        .where((p) => p['in'] == 'path')
        .toList();

    // حطهم في الـ body
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

    // ✅ كل الـ methods تبقى POST
    pathObj.remove('get');
    pathObj.remove('put');
    pathObj.remove('delete');
    pathObj['post'] = methodObj;

    print('✅ Fixed ${entry.key} → POST + body');
  }

  file.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(json),
  );
  print('\n🎉 Done!');
}


