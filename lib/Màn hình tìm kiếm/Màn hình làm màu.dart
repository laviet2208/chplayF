import 'package:flutter/material.dart';

class Lammau1 extends StatefulWidget {
  final double width;
  final double height;
  const Lammau1({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<Lammau1> createState() => _Lammau1State();
}

class _Lammau1State extends State<Lammau1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: widget.width/(1080/412),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/trangtri2.png')
              )
            ),
          ),

          Container(
            height: 15,
          ),

          Container(
            height: widget.width/(1080/664),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/trangtri3.png')
                )
            ),
          ),
        ],
      ),
    );
  }
}
