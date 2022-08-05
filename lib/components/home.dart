import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:queritel_practical/components/AnimalsCards/index.dart';
import 'package:queritel_practical/utils/shortcut.dart';
import 'package:flutter/foundation.dart';

import '../api/Data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool show = false;
  String petShow = "";
  bool loading = false;
  var cats;
  var dogs;

  getCats () async {
    setState(() {
      loading = true;
    });
    var data = await getInfoCats(context);
    setState(() {
      cats = data;
      petShow = "cats";
      loading = false;
    });
    print(cats);
  }

  getDogs () async {
    setState(() {
      loading = true;
    });
    var data = await getInfoDogs(context);
    setState(() {
      dogs = data;
      petShow = "dogs";
      loading = false;
    });
    print(dogs);
  }

  @override
  void initState() {
    // TODO: implement initState
    getCats();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 1],
                  colors: [Color.fromARGB(255, 83, 32, 81), Color.fromARGB(255, 179, 123, 49)],
                ),
            ),
            height: defaultTargetPlatform == TargetPlatform.windows ? mediaHeight(context, 0.2) : mediaHeight(context, 0.15),
            width: mediaWidth(context, 1),
            child: Material(
                type: MaterialType.transparency,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(defaultTargetPlatform == TargetPlatform.windows) 
                    Container(
                      margin: EdgeInsets.only(
                        right: mediaWidth(context, 0.2)
                      ),
                      child: Image.asset(
                        "lib/assets/pet.png",
                        width: mediaWidth(context, 0.07),
                        height: mediaHeight(context, 0.07),
                      ),
                    ),
                    Container(
                      height: mediaHeight(context, 0.2),
                      decoration: BoxDecoration(
                        border: petShow == "cats" ? Border(
                          bottom: BorderSide(
                            width: mediaWidth(context, 0.01),
                            color: Color.fromARGB(255, 221, 11, 11)
                          )
                        )
                        :
                        null
                      ),
                      margin: EdgeInsets.only(
                        top: mediaHeight(context, 0.02)
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (petShow != "cats")
                          getCats();  
                          setState(() {
                            show = true;
                          });
                        },
                        child: Image.asset(
                          'lib/assets/black-cat.png',
                          
                          width: mediaWidth(context, 0.2),
                          height: mediaHeight(context, 0.2),
                        ),
                      ),
                    ),
                    Container(
                      height: mediaHeight(context, 0.2),
                      decoration: BoxDecoration(
                        border: petShow == "dogs" ? Border(
                          bottom: BorderSide(
                            width: mediaWidth(context, 0.01),
                            color: Color.fromARGB(255, 221, 11, 11)
                          )
                        )
                        :
                        null
                      ),
                      margin: EdgeInsets.only(
                        top: mediaHeight(context, 0.02)
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (petShow != "dogs") 
                          getDogs();
                          setState(() {
                            show = true;
                          });
                        },
                        child: Image.asset(
                          'lib/assets/dog.png',
                          width: mediaWidth(context, 0.2),
                          height: mediaHeight(context, 0.2),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            height: defaultTargetPlatform == TargetPlatform.windows ? mediaHeight(context, 0.8) : mediaHeight(context, 0.85),
            child: LoadingOverlay(
              isLoading: loading,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: defaultTargetPlatform == TargetPlatform.windows ? mediaHeight(context, 0.1) : 0
                  ),
                  height: mediaHeight(context, 0.85),
                  child: GridView.count(
                    crossAxisCount: defaultTargetPlatform == TargetPlatform.windows ? 3 : 2,
                    children: [
          
                      if(petShow == "cats") 
                          ...cats["cats"].map((obj) {
                          return AnimalsCard(info: obj);
                      }) else 
                      if(petShow == "dogs")
                          ...dogs["dogs"].map((obj) {
                          return AnimalsCard(info: obj);
                      })                   
                    ],
                  ),
          
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}