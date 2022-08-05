import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:queritel_practical/utils/shortcut.dart';
import 'package:flutter/foundation.dart';

class DetailAnimals extends StatefulWidget {

  @override
  State<DetailAnimals> createState() => _DetailAnimalsState();
}

class _DetailAnimalsState extends State<DetailAnimals> {

  var data;
  bool loading = false;

  getData() {
    setState(() {
      loading = true;
    });
    var info = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      data = info;
      loading = false;
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
        padding: EdgeInsets.only(
          bottom: mediaHeight(context, 0.1),
        ),
        margin: EdgeInsets.only(
          top: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) :0
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (defaultTargetPlatform != TargetPlatform.windows ) Container(
                margin: EdgeInsets.only(
                  right: mediaWidth(context, 0.8),
                  top: mediaHeight(context, 0.05)
                ),
                child: IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Image.network(
                data["photo"],
                width: mediaWidth(context, 0.7),
                height: mediaHeight(context, 0.3)
              ),
              Text(
                data["name"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.15),
                  fontFamily: "Montserrat"
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Image.asset(
                      'lib/assets/confetti.png',
                      width: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.1),
                      height: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaHeight(context, 0.1),
                    ),
                    Text(
                        'Age: ${data["age"]}',
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.01) : mediaWidth(context, 0.05),
                        fontFamily: "Montserrat"
                      ),
                    ),
                    Image.asset(
                      'lib/assets/confetti.png',
                      width: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.1),
                      height: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaHeight(context, 0.1),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'lib/assets/balance.png',
                      width: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.1),
                      height: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaHeight(context, 0.1),
                    ),
                    Text(
                      'Weight: ${data["weight"]}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.01) : mediaWidth(context, 0.05),
                        fontFamily: "Montserrat"
                      ),
                    ),
                    Image.asset(
                      'lib/assets/balance.png',
                      width: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.1),
                      height: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaHeight(context, 0.1),
                    ),
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.all(mediaWidth(context, 0.05)),
                height: mediaHeight(context, 0.5),
                child: Column(
                  mainAxisAlignment: defaultTargetPlatform == TargetPlatform.windows ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Text(
                          'How is ${data["name"]}?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.05),
                            fontFamily: "Montserrat"
                          ),
                        ),
                        Image.asset(
                          'lib/assets/question.png',
                          width:defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.1),
                          height: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaHeight(context, 0.1),
                        ),
                      ],
                    ),
                    Text(
                      data["description"],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: defaultTargetPlatform == TargetPlatform.windows ?mediaWidth(context, 0.02) : mediaWidth(context, 0.05),
                        fontFamily: "Montserrat"
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}