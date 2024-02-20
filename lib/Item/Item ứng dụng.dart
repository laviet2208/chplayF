import 'package:chplayf/Item/%E1%BB%A8ng%20d%E1%BB%A5ng.dart';
import 'package:flutter/material.dart';

class Itemungdung extends StatelessWidget {
  final appInfo app;
  final double width;
  final double height;
  const Itemungdung({Key? key, required this.width, required this.height, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            height: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(app.url)
              )
            ),
          ),

          Container(height: 10,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              app.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 13.7,
                  color: Colors.black
              ),
            ),
          ),

          Container(height: 8,),

          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  app.star,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black
                  ),
                ),

                Icon(
                  Icons.star,
                  size: 12,
                ),

                Container(width: 10,),

                Text(
                  app.cost,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
