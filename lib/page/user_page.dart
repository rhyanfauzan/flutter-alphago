import 'package:alphago/data/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/avatar.png',
                    fit: BoxFit.cover,
                    width: 64,
                    height: 64,
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat Datang,',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                    Text('Antony Gunawan',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                    Text('antonygunawan@gmail.com',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_user.png',
                      height: 22,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text('Profile Saya ',
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_list.png',
                      height: 22,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text('Bookmark ',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_call.png',
                      height: 22,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text('Customer Service ',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_about.png',
                      height: 22,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text('Tentang Kami ',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_setting.png',
                      height: 22,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text('Setting ',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_logout.png',
                      height: 22,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text('Logout ',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
