import 'package:flutter/material.dart';
import 'package:laravel/controller/provider/dataprovider.dart';
import 'package:laravel/controller/provider/saloonprovider.dart';
import 'package:laravel/controller/provider/serviceprovider.dart';
import 'package:laravel/view/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Dataprovider()),
        ChangeNotifierProvider(create: (ctx) => serviceprovider()),
        ChangeNotifierProvider(create: (ctx) => Saloonprovider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.pink,
            accentColor: Colors.black,
            textTheme: ThemeData.light().textTheme.copyWith(
                headline1: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                headline2: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w300))),
        home: Homescreen(),
      ),
    );
  }
}
