import 'package:travel_app/views/artikel.dart';
import 'package:travel_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/views/transaksi.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late int _bottomNavIndex = 0;
  final List<Widget> _container = [
    const HomeScreen(),
    const Artikel(),
    const Transaksi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.amber[800],
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          currentIndex: _bottomNavIndex,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.amber[800],
                ),
                icon: const Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: "Beranda"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.article_outlined,
                  color: Colors.amber[800],
                ),
                icon: const Icon(
                  Icons.article_outlined,
                  color: Colors.grey,
                ),
                label: "Artikel"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.wallet_rounded,
                  color: Colors.amber[800],
                ),
                icon: const Icon(
                  Icons.wallet_rounded,
                  color: Colors.grey,
                ),
                label: "Transaksi"),
          ]),
    );
  }
}
