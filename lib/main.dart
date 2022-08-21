import 'package:flutter/material.dart';
import 'package:seek_task/Screens/home_screen.dart';
import 'package:seek_task/Widgets/search_stores.dart';

import 'Screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Seek Task',
      home: MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: wd / 1.2,
          child: BottomNavigationBar(
              currentIndex: index,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.search))
                // icon: IconButton(
                //     onPressed: () {
                //       showSearch(
                //           context: context,
                //           delegate: CustomSearchDelegate(
                //               allStores: allStores,
                //               storeSuggestions: storeSuggestions));
                //     },
                //     icon: Icon(Icons.search))),
              ]),
        ),
      ),
      body: DefaultTabController(length: 2, child: mainScreens[index]),
    );
  }

  
}

List<Widget> mainScreens = [
  DefaultTabController(length: 2, child: HomePage()),
  SearchScreen()
];
