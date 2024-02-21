import 'package:chplayf/Item/t%C3%ACm%20ki%E1%BA%BFm.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20ch%C3%ADnh/Screenmain.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20t%C3%ACm%20ki%E1%BA%BFm/Hi%E1%BB%83n%20th%E1%BB%8B%20t%C3%ACm%20ki%E1%BA%BFm.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20t%C3%ACm%20ki%E1%BA%BFm/M%C3%A0n%20h%C3%ACnh%20l%C3%A0m%20m%C3%A0u.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController searchText = TextEditingController();
  List<String> tukhoa = ['vssid','vng','vneid','vietcombank','viettinbank','vtvgo','vcb','vcb digibank','vcbs','vcb smart otp','vcomsat','mb bank','mb priority','mb3','mbs','mbccs','mbanking'];
  List<timkiem> timkiemlist = [];
  List<timkiem> chosenList = [];

  void onSearchTextChanged(String value) {
    setState(() {chosenList = timkiemlist.where((account) => account.Title.toLowerCase().contains(value.toLowerCase())).toList();});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timkiemlist.add(timkiem(Type: 1, Title: 'mb bank'));
    timkiemlist.add(timkiem(Type: 1, Title: 'mb priority'));
    timkiemlist.add(timkiem(Type: 2, Title: 'mb3'));
    timkiemlist.add(timkiem(Type: 2, Title: 'mbs'));
    timkiemlist.add(timkiem(Type: 2, Title: 'mbccs'));
    timkiemlist.add(timkiem(Type: 2, Title: 'mbanking'));
    timkiemlist.add(timkiem(Type: 1, Title: 'vssid'));
    timkiemlist.add(timkiem(Type: 1, Title: 'vsid'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vng'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vneid'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vtvgo'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vssid mới nhất'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vssid bhxh viet nam'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vssid bảo hiểm xã hội'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vssid bao hiem'));
    timkiemlist.add(timkiem(Type: 1, Title: 'vcb'));
    timkiemlist.add(timkiem(Type: 1, Title: 'vcb digibank'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vietcombank'));
    timkiemlist.add(timkiem(Type: 2, Title: 'viettinbank'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vng'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vcbs'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vcb smart otp'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vcb smart'));
    timkiemlist.add(timkiem(Type: 2, Title: 'vcomsat'));

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
                          controller: searchText,
                          onChanged: onSearchTextChanged,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tìm kiếm ứng dụng và trò chơi',
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
                          searchText.text.isEmpty ? Icons.mic_none : Icons.mic_none,
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
              child: searchText.text.isEmpty ? Lammau1(width: screenWidth, height: screenHeight - (40 + screenHeight/(2400/160) + 5)) : Ketquatimkiem(width: screenWidth, height: screenHeight - (40 + screenHeight/(2400/160) + 5), queryList: chosenList),
            )
          ],
        ),
      ),
    );
  }
}
