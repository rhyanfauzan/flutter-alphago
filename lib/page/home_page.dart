import 'package:alphago/page/beranda_page.dart';
import 'package:alphago/page/konsultasi_page.dart';
import 'package:alphago/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alphago/controller/c_home.dart';

import '../config/app_asset.dart';
import '../config/app_color.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.iconBeranda, 'label': 'Home'},
    {'icon': AppAsset.iconKonsul, 'label': 'Konsultasi'},
    {'icon': AppAsset.iconUser, 'label': 'User'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cHome.indexPage == 0) {
          return const BerandaPage();
        }
        if (cHome.indexPage == 1) {
          return const KonsultasiPage();
        }
        if (cHome.indexPage == 2) {
          return UserPage();
        }
        return const KonsultasiPage();
      }),
      bottomNavigationBar: Obx(() {
        return Material(
          elevation: 8,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: BottomNavigationBar(
              currentIndex: cHome.indexPage,
              onTap: (value) => cHome.indexPage = value,
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: AppColor.primary,
              ),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              selectedFontSize: 12,
              items: listNav.map((e) {
                return BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(e['icon'])),
                  label: e['label'],
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
