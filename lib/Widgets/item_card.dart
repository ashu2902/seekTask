import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({required this.data, required this.index, Key? key})
      : super(key: key);
  final Map<String, Map<String, String>> data;
  final int index;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: Stack(children: [
        Image.asset(
          widget.data.values.elementAt(widget.index).values.first,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Text(
                  widget.data.values.elementAt(widget.index).values.last,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                )),
                Container(
                    child: Text(
                  widget.data.keys.elementAt(widget.index),
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
