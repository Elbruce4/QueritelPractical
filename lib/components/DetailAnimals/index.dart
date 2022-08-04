import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:queritel_practical/utils/shortcut.dart';

class DetailAnimals extends StatefulWidget {

  @override
  State<DetailAnimals> createState() => _DetailAnimalsState();
}

class _DetailAnimalsState extends State<DetailAnimals> {

  var data;

  getData() {
    var info = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      data = info;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getData();
  }
/* 
  @override
  void initState() {
    getData();
  } */

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        height: mediaHeight(context, 0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /* Image(
              image: data["photo"],
              width: mediaWidth(context, 0.7),
              height: mediaHeight(context, 0.3)
            ), */
            Image.network(
              data["photo"],
              width: mediaWidth(context, 0.7),
              height: mediaHeight(context, 0.3)
            ),
            Text(
              data["name"],
              style: TextStyle(
                color: Colors.black,
                fontSize: mediaWidth(context, 0.2)
              ),
            ),
            Text(
              'Age: ${data["age"]}',
              style: TextStyle(
                color: Colors.black,
                fontSize: mediaWidth(context, 0.1)
              ),
            ),
            Text(
              'Weight: ${data["weight"]}',
              style: TextStyle(
                color: Colors.black,
                fontSize: mediaWidth(context, 0.1)
              ),
            ),
            Text(
              data["description"],
              style: TextStyle(
                color: Colors.black,
                fontSize: mediaWidth(context, 0.05)
              ),
            )
          ],
        ),
      ),
    );
  }
}