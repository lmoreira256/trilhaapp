import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/registration_data_page.dart';

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
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Text('Dados cadastrais'),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationDataPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
              children: [
                Container(
                  color: Colors.blueGrey,
                ),
                Container(
                  color: Colors.yellowAccent,
                ),
                Container(
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
          BottomNavigationBar(
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
            ],
          ),
        ],
      ),
    );
  }
}
