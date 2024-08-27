import 'package:flutter/material.dart';
import 'package:sneaker_ecommerce/controllers/mainscreen_provider.dart';
import 'package:sneaker_ecommerce/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}