import 'package:flutter/material.dart';
import 'package:task2/itemsModel.dart';
import 'package:task2/myText.dart';


class myCard extends StatelessWidget {
  myCard({super.key, required this.items});

  ItemsModel? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        children: [
          SizedBox(width: double.infinity,
              height: 130,
              child: Image.asset('${items?.image}')),
          Divider(color: Colors.black, thickness: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              myText(data: "${items?.name}"),
              myText(data: "${items?.color}",),
            ],
          )
        ],
      ),
    );
  }
}