import 'package:chplayf/Item/Item%20t%C3%ACm%20ki%E1%BA%BFm.dart';
import 'package:chplayf/Item/t%C3%ACm%20ki%E1%BA%BFm.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20k%E1%BA%BFt%20qu%E1%BA%A3/Mbbank.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20k%E1%BA%BFt%20qu%E1%BA%A3/Vcb.dart';
import 'package:chplayf/M%C3%A0n%20h%C3%ACnh%20k%E1%BA%BFt%20qu%E1%BA%A3/Vssid.dart';
import 'package:flutter/material.dart';

class Ketquatimkiem extends StatefulWidget {
  final double width;
  final double height;
  final List<timkiem> queryList;
  const Ketquatimkiem({Key? key, required this.width, required this.height, required this.queryList}) : super(key: key);

  @override
  State<Ketquatimkiem> createState() => _KetquatimkiemState();
}

class _KetquatimkiemState extends State<Ketquatimkiem> {
  List<timkiem> timkiemlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: widget.queryList.length <= 5 ? widget.queryList.length : 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              child: Itemtimkiem(title: widget.queryList[index].Title, type: widget.queryList[index].Type, width: widget.width, height: 50),
              onTap: () {
                if (widget.queryList[index].Title == 'vssid' || widget.queryList[index].Title == 'vss') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Vssid()),
                  );
                }
                if (widget.queryList[index].Title == 'mb bank' ||widget.queryList[index].Title == 'mb priority') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Mbbank()),
                  );
                }
                if (widget.queryList[index].Title == 'vcb' ||widget.queryList[index].Title == 'vcb digibank') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Vcb()),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

