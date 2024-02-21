import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Itemtimkiem extends StatelessWidget {
  final String title;
  final int type;
  final double width;
  final double height;
  const Itemtimkiem({Key? key, required this.title, required this.type, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 8,
            bottom: 8,
            left: 15,
            child: Container(
              width: height - 16,
              height: height - 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: type == 1 ? AssetImage('assets/image/history.png') : AssetImage('assets/image/search.png')
                )
              ),
            ),
          ),

          Positioned(
            left: 30 + (height - 16),
            right: 30 + (height - 16),
            top: 16,
            bottom: 16,
            child: AutoSizeText(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 100
              ),
            ),
          ),

          Positioned(
            top: 8,
            bottom: 8,
            right: 15,
            child: Container(
              width: height - 16,
              height: height - 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/icontrangtri.png')
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
