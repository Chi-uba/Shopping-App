import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/screen_controller.dart';
import 'app_theme.dart';
import 'package:shopping_app/screens/AppData.dart';
void main() {
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider<ItemsOnSale>(create: (context) => ItemsOnSale())
        ],
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = app_theme.dark();
    return MaterialApp(
      title: 'SHOPPING APP',
      theme: theme,
      home: const ScreenController(),
    );
  }
}
