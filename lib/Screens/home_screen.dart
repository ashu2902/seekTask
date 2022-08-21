import 'package:flutter/material.dart';
import 'package:seek_task/Screens/story_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ht / 15,
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                      child: Text(
                    "Today",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TabBar(
                      indicatorWeight: 1,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      labelPadding: const EdgeInsets.all(0),
                      onTap: ((value) {
                        setState(() {
                          index = DefaultTabController.of(context)!.index;
                        });
                      }),
                      tabs: [
                        Tab(
                          child: Text(
                            'New&Popular',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color:
                                    DefaultTabController.of(context)!.index == 0
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.3)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tab(
                              child: Text(
                                'Story',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: DefaultTabController.of(context)!
                                                .index ==
                                            1
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.3)),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: ht * 2,
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(wd / 4),
                          child: Text("Please click on Story"),
                        ),
                        Container(height: ht, child: StoryScreen())
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
