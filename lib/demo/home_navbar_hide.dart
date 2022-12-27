import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/utils/functions/scroll_listener/scroll_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollListener _model;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _model = ScrollListener.initialise(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _model,
          builder: (context, child) {
            return Stack(
              children: [
                CustomScrollView(
                  // controller: _controller,
                  slivers: [
                    const TaskamoAppbar(),
                    SliverList(
                      // Use a delegate to build items as they're scrolled on screen.
                      delegate: SliverChildBuilderDelegate(
                        // The builder function returns a ListTile with a title that
                        // displays the index of the current item.
                        (context, index) =>
                            ListTile(title: Text('Item #$index')),
                        // Builds 1000 ListTiles
                        childCount: 50,
                      ),
                    ),
                    // CupertinoSliverNavigationBar(
                    //   backgroundColor: Colors.black,
                    //   leading: CupertinoNavigationBarBackButton(
                    //     onPressed: () {},
                    //     color: CupertinoColors.activeBlue,
                    //   ),
                    //   middle: Text(
                    //     "Cupertino Sliver Navigation Bar",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   trailing: CupertinoButton(
                    //     padding: EdgeInsets.zero,
                    //     child: Text(
                    //       "Done",
                    //       style: TextStyle(
                    //         color: CupertinoColors.activeBlue,
                    //       ),
                    //     ),
                    //     onPressed: () {},
                    //   ),
                    //   largeTitle: Padding(
                    //     padding: const EdgeInsets.only(left: 20),
                    //     child: Text(
                    //       "Large Tile",
                    //       style: TextStyle(
                    //         color: CupertinoColors.white,
                    //       ),
                    //     ),
                    //   ),
                    //   previousPageTitle: "Back",
                    // ),
                  ],
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BottomNavigationWidget(activeIndex: 4),
                ),
                // Align(
                //     alignment: Alignment.bottomCenter,
                //     child: BottomNavigationWidget(activeIndex: 4)),
              ],
            );
          },
        ),
      ),
      // bottomNavigationBar: CupertinoSliverNavigationBar(),
      // bottomNavigationBar: const BottomNavigationWidget(activeIndex: 4),
    );
  }
}
