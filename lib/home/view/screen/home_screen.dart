import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/view/widgets/Browse.dart';
import 'package:movies_app_route/home_datails/view/widgets/home_details.dart';
import 'package:movies_app_route/search/view/widgets/search.dart';
import 'package:movies_app_route/watchlist/view/widgets/watchlist.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeDetails(),
    Search(),
    Browse(),
    Watchlist(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.house_rounded,
              size: 33,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(
              Icons.search_outlined,
              size: 33,
            ),
          ),
          BottomNavigationBarItem(
            label: "Browse",
            icon: Icon(
              Icons.movie_creation,
              size: 33,
            ),
          ),
          BottomNavigationBarItem(
            label: "Watchlist",
            icon: Icon(
              Icons.collections_bookmark_sharp,
              size: 33,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
    );
  }
}
