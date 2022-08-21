import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seek_task/Widgets/search_stores.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ht / 15,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                    child: Text(
                  "Search",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: wd / 1.4,
                        height: ht / 15,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.search),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(
                                          allStores: allStores,
                                          storeSuggestions: storeSuggestions));
                                },
                                child: Text(
                                  "Search",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child:
                                  Image.asset('assets/products/Group 43.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.camera_alt_outlined),
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

  List<String> allStores = [
    'X-S-Store',
    'Unbox Therapy',
    'fideletty',
    'TheOffWhiteDealer'
  ];
  List<String> storeSuggestions = [
    'X-S-Store',
    'Unbox Therapy',
    'fideletty',
    'TheOffWhiteDealer'
  ];
}
