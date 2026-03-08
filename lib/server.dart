import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_swagger/serverpod_swagger.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:my_mesl7y_app_server/src/web/routes/root.dart';

void run(List<String> args) async {
  final pod = Serverpod(args, Protocol(), Endpoints());
  
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // ✅ حدد المسار بشكل صريح
  pod.webServer.addRoute(
    SwaggerUIRoute(Directory('web')),
    '/swagger/*',
  );

  await pod.start();
}