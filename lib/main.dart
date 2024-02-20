import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20ch%C3%ADnh/Screenmain.dart';
import 'package:flutter/material.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cửa hàng Play',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Screenmain(),
    );
  }
}
