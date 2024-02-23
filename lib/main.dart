import 'dart:convert';
import 'dart:typed_data';

import 'package:chplayf/Data/Final.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20ch%C3%ADnh/Screenmain.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedImageAva = prefs.getString('savedImageAva');
  if (savedImageAva != null) {
    // Chuyển đổi chuỗi thành mảng byte
    List<int> decodedImage = base64Decode(savedImageAva);
    info.bytesAvatar = Uint8List.fromList(decodedImage);
  }
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
