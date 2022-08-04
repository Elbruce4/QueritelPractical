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
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/PetDetails',
            arguments: widget.info
          );
        },
        child: Container(
          height: mediaHeight(context, 0.4),
          width: mediaWidth(context, 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                widget.info["photo"],
                width: mediaWidth(context, 0.3),
                height: mediaHeight(context, 0.2),
                loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              Text(
                widget.info["name"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mediaWidth(context, 0.05)
                ),
              ),
              Text(
                'Age: ${widget.info["age"]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mediaWidth(context, 0.03)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}