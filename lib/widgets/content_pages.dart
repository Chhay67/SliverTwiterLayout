import 'package:flutter/material.dart';
import 'package:silvers_scaffold/pages/home_page.dart';
import 'package:silvers_scaffold/pages/notification_page.dart';
import 'package:silvers_scaffold/pages/profile_page.dart';
import 'package:silvers_scaffold/pages/search_page.dart';
import 'package:silvers_scaffold/shared/constants.dart';

class ContentPages extends StatelessWidget {
  const ContentPages(
      {super.key, required this.scrollController, required this.indexPage,required this.scaffoldKey});
  final ScrollController scrollController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int indexPage;
  @override
  Widget build(BuildContext context) {
    switch (indexPage) {
      case homePageIndex:
        return  HomePage(scrollController: scrollController,);
      case searchPageIndex:
        return  SearchPage(scrollController: scrollController,);
      case notificationPageIndex:
        return const NotificationPage();
      case profilePageIndex:
        return const ProfilePage();
      default:
        return HomePage(scrollController: scrollController,);
    }
   
  }
}
