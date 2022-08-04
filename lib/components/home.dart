import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:queritel_practical/components/AnimalsCards/index.dart';
import 'package:queritel_practical/utils/shortcut.dart';

import '../api/Data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool show = false;
  String petShow = "";
  var cats;
  var dogs;

  getCats () async {
    var data = await getInfoCats(context);
    setState(() {
      cats = data;
      petShow = "cats";
    });
    print(cats);
  }

  getDogs () async {
    var data = await getInfoDogs(context);
    setState(() {
      dogs = data;
      petShow = "dogs";
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
                  GestureDetector(
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
                  GestureDetector(
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
                  )
                ],
              ),
            ),
          ),
          show ?
          Container(
            child: SingleChildScrollView(
              child: Container(
                height: mediaHeight(context, 0.85),
                child: GridView.count(
                  crossAxisCount: 2,
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