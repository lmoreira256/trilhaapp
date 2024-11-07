import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets_page.dart';
import 'package:trilhaapp/pages/list_view_horizontal_page.dart';
import 'package:trilhaapp/pages/list_view_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);

  int _currentIndexPageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageViewController,
              onPageChanged: (value) {
                setState(() {
                  _currentIndexPageView = value;
                });
              },
              children: const [
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                ListViewHorizontalPage(),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndexPageView,
            onTap: (value) {
              _pageViewController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home1',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Home2',
                icon: Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                label: 'Home3',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Home4',
                icon: Icon(Icons.access_alarms_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
