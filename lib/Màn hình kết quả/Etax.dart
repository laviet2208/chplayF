import 'package:chplayf/Item/%E1%BB%A8ng%20d%E1%BB%A5ng.dart';
import 'package:chplayf/Item/Item%20%E1%BB%A9ng%20d%E1%BB%A5ng.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20ch%C3%ADnh/Screenmain.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Etax extends StatefulWidget {
  const Etax({Key? key}) : super(key: key);

  @override
  State<Etax> createState() => _EtaxState();
}

class _EtaxState extends State<Etax> {
  List<appInfo> dexuat = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dexuat.add(appInfo(name: 'Các bài tập về', cost: '', star: '4,9', url: 'assets/image/icon1.png'));
    dexuat.add(appInfo(name: 'Steam', cost: '', star: '2,4', url: 'assets/image/icon2.png'));
    dexuat.add(appInfo(name: 'X', cost: '', star: '3,4', url: 'assets/image/icon3.png'));
    dexuat.add(appInfo(name: 'K12Online', cost: '', star: '2,3', url: 'assets/image/icon4.png'));
    dexuat.add(appInfo(name: 'ePass', cost: '', star: '3,7', url: 'assets/image/icon5.png'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight/(2400/160),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5,
                            color: Color.fromARGB(255, 197, 197, 197)
                        )
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      child: GestureDetector(
                        child: Container(
                          width: 25,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Color.fromARGB(255, 70, 70, 70),

                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Screenmain()),
                          );
                        },
                      ),
                    ),

                    Positioned(
                      top: 10,
                      bottom: 8,
                      left: 70,
                      right: screenWidth/7,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'etax mobile',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 70, 70, 70),
                              fontSize: 16,
                              fontFamily: 'arial',
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 25,
                        child: Icon(
                          Icons.mic_none,
                          color: Color.fromARGB(255, 70, 70, 70),

                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      bottom: 10,
                      right: 45,
                      child: Container(
                        width: 25,
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 70, 70, 70),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 40 + screenHeight/(2400/160) + 5,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  GestureDetector(
                    child: Container(
                      height: screenWidth/(1080/226),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/Etax/trangtri1.png')
                          )
                      ),
                    ),
                    onTap: () async {
                      //List<Application> apps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
                      DeviceApps.openApp('com.etaxmobi.etaxmobi.untitled');
                    },
                  ),

                  Container(
                    height: 30,
                  ),

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
                              'Có thể bạn cũng thích',
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
                    height: screenWidth/(1080/1400),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/mb/trangtri4.png')
                        )
                    ),
                  ),

                  Container(height: 20,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
