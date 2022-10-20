import 'package:alphago/data/color_theme.dart';
import 'package:alphago/widget/artikel.dart';
import 'package:alphago/widget/webinar.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: AppColor.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DView.spaceHeight(30),
                    Text(
                      'Selamat Datang! ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: AppColor.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Upgrade dirimu, Raih Impianmu Jadilah Pemenang Bersama AlphaGo',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColor.white),
                    ),
                    DView.spaceHeight(30),
                  ],
                ),
              ),
            ),
            DView.spaceHeight(10),

            // Banner ------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Tabung
                            Column(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/ic_kompetisi.png',
                                  ),
                                  iconSize: 120,
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         TabungSampahPage(
                                    //       idUser: id_user,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
                            ),
                            // Tukar Poin
                            Column(
                              children: [
                                IconButton(
                                  icon: Image.asset('assets/ic_beasiswa.png'),
                                  iconSize: 120,
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => TukarPoinPage(
                                    //       idUser: id_user,
                                    //       currentPoin: current_poin,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Tabung
                            Column(
                              children: [
                                IconButton(
                                  icon: Image.asset('assets/ic_magang.png'),
                                  iconSize: 120,
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         TabungSampahPage(
                                    //       idUser: id_user,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
                            ),
                            // Tukar Poin
                            Column(
                              children: [
                                IconButton(
                                  icon: Image.asset('assets/ic_events.png'),
                                  iconSize: 120,
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => TukarPoinPage(
                                    //       idUser: id_user,
                                    //       currentPoin: current_poin,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            DView.spaceHeight(30),

            // Informasi ------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Webinar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primary),
                  ),
                  Text(
                    'Klik laman berikut untuk info lebih lanjut! ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColor.grey),
                  ),
                  DView.spaceHeight(12),
                  Webinar(),
                ],
              ),
            ),
            DView.spaceHeight(30),

            // Artikel ------------------------------------------------------------------
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Artikel',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary),
                      ),
                      Text(
                        'Klik laman berikut untuk info lebih lanjut! ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.grey),
                      ),
                      DView.spaceHeight(12),
                      Artikel()
                    ])),
            DView.spaceHeight(30)
          ],
        )),
      ),
    );
  }
}
