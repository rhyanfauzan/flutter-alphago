import 'package:alphago/data/color_theme.dart';
import 'package:alphago/page/beranda_page.dart';
import 'package:alphago/page/konsultasi_page.dart';
import 'package:alphago/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedNavbar = 0;
  final screens = [
    BerandaPage(),
    KonsultasiPage(),
    UserPage(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: screens[_selectedNavbar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedNavbar == 0
                  ? Image.asset('assets/ic_home_aktif.png')
                  : Image.asset('assets/ic_home.png'),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: _selectedNavbar == 1
                  ? Image.asset('assets/ic_konsul_aktif.png')
                  : Image.asset('assets/ic_konsul.png'),
              label: 'Konsultasi'),
          BottomNavigationBarItem(
              icon: _selectedNavbar == 2
                  ? Image.asset('assets/ic_user_aktif.png')
                  : Image.asset('assets/ic_user.png'),
              label: 'User'),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
