import 'package:flutter/material.dart';
import 'package:seek_task/Screens/details_page.dart';
import 'package:seek_task/Screens/story_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(
      {required this.allStores, required this.storeSuggestions});
  final List<String> allStores;
  final List<String> storeSuggestions;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = allStores
        .where((store) => store.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                query = results[index];
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsPage(
                      img: images
                          .where((element) =>
                              element.toString().toLowerCase().contains(query))
                          .toString(),
                      title: query);
                }));
              },
              title: Text(results[index]),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> storesSuggested = storeSuggestions
        .where((store) => store.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      child: ListView.builder(
          itemCount: storesSuggested.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                query = storesSuggested[index];
                var image =
                    prodImages[storesSuggested[index]]!.values.first.toString();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsPage(img: image, title: query);
                }));
              },
              title: Text(storesSuggested[index]),
            );
          }),
    );
  }
}

List<String> stores = [
  "X-S-Store",
  "Unbox Therapy",
  "fidelety",
  "TheOffWhiteDealer",
];
