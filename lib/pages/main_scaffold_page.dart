import 'package:flutter/material.dart';
import 'package:silvers_scaffold/widgets/animation_bottom_bar.dart';
import 'package:silvers_scaffold/widgets/content_pages.dart';

import '../widgets/animation_floating_bar.dart';

class MainScaffoldPage extends StatefulWidget {
  const MainScaffoldPage({super.key});

  @override
  State<MainScaffoldPage> createState() => _MainScaffoldPageState();
}

class _MainScaffoldPageState extends State<MainScaffoldPage> {
  late ScrollController scrollController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _indexPage = 0;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      body: ContentPages(
        scaffoldKey: scaffoldKey,
        scrollController: scrollController,
        indexPage: _indexPage,
      ),
      floatingActionButton: AnimationFloatingBar(
        scrollController: scrollController,
        floatingActionButton: FloatingActionButton(onPressed: () {
          
        },),
      ),
      bottomNavigationBar: AnimationBottomBar(
        scrollController: scrollController,
        child: BottomNavigationBar(
          items: const  [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'notification'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ],
          currentIndex: _indexPage,
          selectedItemColor: const Color.fromARGB(255, 80, 118, 81),
          unselectedItemColor: Colors.black45,
          onTap: (index) {
            setState(() {
              _indexPage = index;
            });
          },
        ),
      ),
    );
  }
}


