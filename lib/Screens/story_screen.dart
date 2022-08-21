import 'package:flutter/material.dart';
import 'package:seek_task/Screens/details_page.dart';
import 'package:seek_task/Widgets/item_card.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wd = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: prodImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                img: images[index],
                                title: storenames[index],
                              )));
                },
                child: SizedBox(
                    height: wd / 1.1,
                    width: wd / 1.1,
                    child: ItemCard(
                      data: prodImages,
                      index: index,
                    )),
              );
            }),
      ),
    ));
  }
}

Map<String, Map<String, String>> prodImages = {
  'X-S-Store': {
    'img': 'assets/products/img.png',
    'storeDesc': 'Welcome X-S-Store',
  },
  'Unbox Therapy': {
    'img': 'assets/products/img (1).png',
    'storeDesc': 'Nike Adapt BB Unboxing - Futuristic Self Lacing Sneakers',
  },
  'fideletty':
      {
    'img': 'assets/products/img (2).png',
    'storeDesc': 'Nike Alphafly Next% Full & Final Review | Carbon Fiber Plate Marathon Shoe',
  },
  "TheOffWhiteDealer": {
    'img': 'assets/products/img (3).png',
    'storeDesc': 'About\nJordan 1 Mid Chicago Toe'
  },
};
List storenames = [
  "X-S-Store",
  "Unbox Therapy",
  "fidelety",
  "TheOffWhiteDealer"
];
List images = [
  'assets/products/img.png',
  'assets/products/img (1).png',
  'assets/products/img (2).png',
  'assets/products/img (3).png'
];
