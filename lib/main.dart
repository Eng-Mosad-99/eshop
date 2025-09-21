import 'package:eshop/config/router/app_router.dart';
import 'package:eshop/core/di/service_locator.dart';
import 'package:flutter/material.dart';

import 'config/router/routes.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
