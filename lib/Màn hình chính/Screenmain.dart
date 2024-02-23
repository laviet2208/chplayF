import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:chplayf/Data/Final.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chplayf/Item/Item%20%E1%BB%A9ng%20d%E1%BB%A5ng.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20t%C3%ACm%20ki%E1%BA%BFm/Screensearch.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../Item/Ứng dụng.dart';
class Screenmain extends StatefulWidget {
  const Screenmain({Key? key}) : super(key: key);

  @override
  State<Screenmain> createState() => _ScreenmainState();
}

class _ScreenmainState extends State<Screenmain> {
  List<appInfo> tinhphi = [];
  List<appInfo> dexuat = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tinhphi.add(appInfo(name: 'My budget bug', cost: '111.000 đ', star: '4,3', url: 'assets/image/icon6.png'));
    tinhphi.add(appInfo(name: 'MOODA', cost: '23.000 đ', star: '4,8', url: 'assets/image/icon7.png'));
    tinhphi.add(appInfo(name: 'Elephant money', cost: '67.000 đ', star: '3,7', url: 'assets/image/icon8.png'));
    tinhphi.add(appInfo(name: 'Board game', cost: '127.000 đ', star: '3,7', url: 'assets/image/icon9.png'));

    dexuat.add(appInfo(name: 'Các bài tập về', cost: '', star: '4,9', url: 'assets/image/icon1.png'));
    dexuat.add(appInfo(name: 'Steam', cost: '', star: '2,4', url: 'assets/image/icon2.png'));
    dexuat.add(appInfo(name: 'X', cost: '', star: '3,4', url: 'assets/image/icon3.png'));
    dexuat.add(appInfo(name: 'K12Online', cost: '', star: '2,3', url: 'assets/image/icon4.png'));
    dexuat.add(appInfo(name: 'ePass', cost: '', star: '3,7', url: 'assets/image/icon5.png'));
  }

  Uint8List? registrationImage = info.bytesAvatar;
  final picker = ImagePicker();

  Future<void> saveImageToSharedPreferences(Uint8List bytes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Chuyển đổi mảng byte thành chuỗi và lưu vào SharedPreferences
    String encodedImage = base64Encode(bytes);
    info.bytesAvatar = bytes;
    setState(() {

    });
    await prefs.setString('savedImageAva', encodedImage);
  }

  Future<void> galleryImagePicker() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      // Người dùng không chọn hình ảnh
      return;
    }

    List<int> imageBytes = await pickedFile.readAsBytes();
    Uint8List bytesFromPicker = Uint8List.fromList(imageBytes);

    // Lưu ảnh vào SharedPreferences
    await saveImageToSharedPreferences(bytesFromPicker);

    setState(() {
      registrationImage = bytesFromPicker;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: screenHeight/12,
              left: 0,
              right: 0,
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(height: 45,),

                    Container(
                      height: screenHeight/(2400/130),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                          ),

                          Container(
                            width: screenWidth/3*2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Color.fromARGB(255, 233, 237, 246)
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: screenHeight/(2400/130)/3 - 2,
                                  bottom: screenHeight/(2400/130)/3 - 2,
                                  left: 14,
                                  child: Container(
                                    width: screenHeight/(2400/130)/3 + 4,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/image/searchicon.png')
                                        )
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: screenHeight/(2400/130)/3 - 2,
                                  bottom: screenHeight/(2400/130)/3 - 2,
                                  left: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        'Tìm kiếm ứng dụ...',
                                        style: TextStyle(
                                            fontSize: 110,
                                            color: Color.fromARGB(255, 68, 71, 76)
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => ScreenSearch()),
                                      );
                                    },
                                  ),
                                ),

                                Positioned(
                                  top: screenHeight/(2400/130)/3 - 2,
                                  bottom: screenHeight/(2400/130)/3 - 2,
                                  right: 14,
                                  child: Container(
                                    width: screenHeight/(2400/130)/3 + 4,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/image/microicon.png')
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 5,
                          ),

                          Container(
                            width: (screenWidth/(1080/110)),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage('assets/image/bellicon.png')
                                )
                            ),
                          ),

                          Container(
                            width: 5,
                          ),

                          GestureDetector(
                            child: Container(
                              width: screenHeight/(2400/130),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  height: screenHeight/(2400/130),
                                  width: screenHeight/(2400/130),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, // Đặt hình dạng là hình tròn
                                  ),
                                  child: ClipOval(
                                    child: Image.memory(
                                      registrationImage!,
                                      fit: BoxFit.cover, // Chọn kiểu fit phù hợp với yêu cầu của bạn
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              await galleryImagePicker();
                            },
                          ),

                          // Container(
                          //   width: screenHeight/(2400/130),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(4),
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           image: DecorationImage(
                          //               fit: BoxFit.fitWidth,
                          //               image: AssetImage('assets/image/icon5.png')
                          //           ),
                          //           borderRadius: BorderRadius.circular(1000)
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                    Container(height: 15,),

                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          Container(width: 20,),

                          Container(
                            width: screenWidth/(1080/165),
                            child: AutoSizeText(
                              'Cho bạn',
                              style: TextStyle(
                                  fontSize: 100,
                                  color: Color.fromARGB(255, 12, 86, 207)
                              ),
                            ),
                          ),

                          Container(width: 25,),

                          Container(
                            width: screenWidth/(1080/275),
                            child: AutoSizeText(
                              'Bảng xếp hạng',
                              style: TextStyle(
                                  fontSize: 100,
                                  color: Color.fromARGB(255, 70,70,70)
                              ),
                            ),
                          ),

                          Container(width: 25,),

                          Container(
                            width: screenWidth/(1080/135),
                            child: AutoSizeText(
                              'Trẻ em',
                              style: TextStyle(
                                  fontSize: 100,
                                  color: Color.fromARGB(255, 70,70,70)
                              ),
                            ),
                          ),

                          Container(width: 25,),

                          Container(
                            width: screenWidth/(1080/85),
                            child: AutoSizeText(
                              'Loại',
                              style: TextStyle(
                                  fontSize: 100,
                                  color: Color.fromARGB(255, 70,70,70)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(height: 10,),

                    Container(
                      height: 5,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 229, 229, 229)
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 0.8,
                            left: 20,
                            child: Container(
                              height: 2,
                              width: screenWidth/(1080/165),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 12, 86, 207),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(height: 20,),

                    Container(
                      height: 22,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 20,
                            right: 10,
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Ứng dụng có tính phí',
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 20,
                            child: Container(
                              width: 22,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 22,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(height: 20,),

                    Container(
                      height: screenHeight/(2400/455),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Đặt scrollDirection thành Axis.horizontal
                        itemCount: tinhphi.length,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 15 ),
                            child: Itemungdung(
                              width: screenWidth/(1080/290),
                              height: screenHeight/(2400/455),
                              app: tinhphi[index],
                            ),
                          );
                        },
                      ),
                    ),

                    Container(height: 35,),

                    Container(
                      height: 22,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 20,
                            right: 10,
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Được đề xuất cho bạn',
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 2,
                            bottom: 2,
                            right: 20,
                            child: Container(
                              width: 18,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/image/threedoticon.png')
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(height: 20,),

                    Container(
                      height: screenHeight/(2400/455),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Đặt scrollDirection thành Axis.horizontal
                        itemCount: dexuat.length,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 15 ),
                            child: Itemungdung(
                              width: screenWidth/(1080/290),
                              height: screenHeight/(2400/455),
                              app: dexuat[index],
                            ),
                          );
                        },
                      ),
                    ),

                    Container(height: 20,),

                    Container(
                      height: screenWidth/(1080/815),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image/trangtri1.png')
                        )
                      ),
                    ),

                    Container(height: 20,),

                    Container(
                      height: 22,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 20,
                            right: 10,
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Giải trí',
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 20,
                            child: Container(
                              width: 22,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 22,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(height: 20,),

                    Container(
                      height: screenHeight/(2400/455),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Đặt scrollDirection thành Axis.horizontal
                        itemCount: dexuat.length,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 15 ),
                            child: Itemungdung(
                              width: screenWidth/(1080/290),
                              height: screenHeight/(2400/455),
                              app: dexuat[index],
                            ),
                          );
                        },
                      ),
                    ),

                    Container(height: 20,),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight/12,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 242, 247)
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      left: 30,
                      child: Container(
                        height: (screenHeight/12) - 15,
                        width: (screenHeight/12 - 15)/(152/163),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/bottomicon1.png')
                          )
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: (screenWidth - ((screenHeight/12 - 15)/(152/163)))/2,
                      child: Container(
                        height: (screenHeight/12) - 15,
                        width: (screenHeight/12 - 15)/(152/163),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/bottomicon2.png')
                            )
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 30,
                      child: Container(
                        height: (screenHeight/12) - 15,
                        width: (screenHeight/12 - 15)/(152/163),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/bottomicon3.png')
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
