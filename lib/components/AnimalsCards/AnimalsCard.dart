import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:queritel_practical/utils/shortcut.dart';

class AnimalsCard extends StatefulWidget {
  var info;

  AnimalsCard({
    required this.info
  });

  @override
  State<AnimalsCard> createState() => _AnimalsCardState();
}

class _AnimalsCardState extends State<AnimalsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            widget.info["photo"],
            width: mediaWidth(context, 0.3),
            height: mediaHeight(context, 0.2),
          ),
          Text(
            widget.info["name"],
            style: TextStyle(
              color: Colors.black,
              fontSize: mediaWidth(context, 0.05)
            ),
          )
        ],
      ),
    );
  }
}