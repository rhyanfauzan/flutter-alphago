import 'package:alphago/config/app_color.dart';
import 'package:alphago/config/app_route.dart';
import 'package:alphago/config/session.dart';
import 'package:alphago/controller/c_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GetBuilder<CUser>(builder: (_) {
            // get data user from firebase
            var userName = _.data.name;
            var userEmail = _.data.email;
            return Column(
              children: [
                const SizedBox(
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
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Selamat Datang,',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            )),
                        Text('${userName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            )),
                        Text('${userEmail}',
                            style: const TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon_user.png',
                          height: 22,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text('Profile Saya ',
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: AppColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon_list.png',
                          height: 22,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text('Bookmark ',
                            style: TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: AppColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon_call.png',
                          height: 22,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text('Customer Service ',
                            style: TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: AppColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon_about.png',
                          height: 22,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text('Tentang Kami ',
                            style: TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: AppColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon_setting.png',
                          height: 22,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text('Setting ',
                            style: TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Material(
                  color: AppColor.backgroundScaffold,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Session.clearUser();
                      Navigator.pushReplacementNamed(context, AppRoute.signin);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon_logout.png',
                            height: 22,
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          const Text('Logout ',
                              style: TextStyle(
                                color: AppColor.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      )),
    );
  }
}
