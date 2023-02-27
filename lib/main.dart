import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacedmemoryapp/CardsManager.dart';
import 'package:spacedmemoryapp/Home.dart';
import 'package:spacedmemoryapp/NewCard.dart';

import 'Components/Data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (BuildContext context) {
        return Data();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            '/cardsmanager': (context) => CardsManager(),
            '/addcard': (context) => NewCard(),
          }),
    );
  }
}
