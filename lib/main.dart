import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/home.dart';
import 'package:provider_flutter/model/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return Cart();
        },
        child: MaterialApp(
          theme:
              ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
          debugShowCheckedModeBanner: false,
          title: "smart phone",
          home: Home(),
        ));
  }
}
