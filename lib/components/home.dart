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

/*   @override
  void initState() {
    // TODO: implement initState
    getCats();
  } */

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
              color: Colors.grey
            ),
            height: mediaHeight(context, 0.15),
            width: mediaWidth(context, 1),
            child: Material(
              type: MaterialType.transparency,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(defaultTargetPlatform == TargetPlatform.windows) (
                    Image.asset(
                      "lib/assets/logoPets.png",
                      width: mediaWidth(context, 0.05),
                      height: mediaHeight(context, 0.05),)
                  ),
                  Container(
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
                      child: Text(
                        "CATS",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: mediaWidth(context, 0.07)
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                      child: Text(
                        "DOGS",
                        style: TextStyle(
                          color: Colors.black,                      
                          fontSize: mediaWidth(context, 0.07)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          show ?
          Container(
            height: mediaHeight(context, 0.85),
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
          :
          Text(
            "Select one of the options please",
            style: TextStyle(
              color: Colors.black,
              fontSize: mediaWidth(context, 0.05)
            ),
          )
        ],
      )
    );
  }
}