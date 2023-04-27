import 'package:flutter/material.dart';
import 'package:flutter_learn/routing/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  ///全局配置路由入口
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Demo',
      onGenerateRoute: FLRouter.generateRoute,
      initialRoute: FLRouter.main,
    );
  }
}
