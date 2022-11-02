import 'package:flutter/material.dart';
import 'package:alphago/config/app_color.dart';

class Artikel extends StatefulWidget {
  const Artikel({
    Key? key,
  }) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // item 1
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Material(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => InformasiDetailPage(
                  //       id_informasi: id_informasi,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  width: 220,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/artikel1.png',
                      width: 220,
                      // height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // item 2
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Material(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => InformasiDetailPage(
                  //       id_informasi: id_informasi,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  width: 220,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/artikel1.png',
                      width: 220,
                      // height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // item 3
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Material(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => InformasiDetailPage(
                  //       id_informasi: id_informasi,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  width: 220,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/artikel1.png',
                      width: 220,
                      // height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
