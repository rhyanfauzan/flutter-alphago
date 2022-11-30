import 'package:alphago/config/app_color.dart';
import 'package:alphago/config/app_route.dart';
import 'package:alphago/config/session.dart';
import 'package:alphago/model/user.dart';
import 'package:alphago/source/auth_service.dart';
import 'package:alphago/source/user_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  _UserPageState();

  String? userNameGoogle = FirebaseAuth.instance.currentUser?.displayName;
  String? userEmailGoogle = FirebaseAuth.instance.currentUser?.email;
  late Future<UserModel?> futureUser;
  String? emailUser;
  final getBox = GetStorage();

  @override
  void initState() {
    super.initState();
    emailUser = getBox.read('emailUser');
    if (emailUser != null) {
      futureUser = UserSource.getWhereEmail(emailUser!);
    } else {
      futureUser = UserSource.getWhereEmail('user@gmail.com');
    }
  }

  logout() async {
    getBox.remove('emailUser');
    Session.clearUser();
    AuthService().signOut();
    Navigator.pushReplacementNamed(context, AppRoute.signin);
  }

  @override
  Widget build(BuildContext context) {
    print('emailUser: ${emailUser}');
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30),
        //   child: GetBuilder<CUser> (builder: (_) {
        //     // get data user from firebase
        //     userName = _.data.name;
        //     userEmail = _.data.email;
        //     return Column(
        //       children: [
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Row(
        //           children: [
        //             ClipRRect(
        //               borderRadius: BorderRadius.circular(100),
        //               child: Image.asset(
        //                 'assets/avatar.png',
        //                 fit: BoxFit.cover,
        //                 width: 64,
        //                 height: 64,
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 17,
        //             ),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 const Text('Selamat Datang,',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 14,
        //                     )),
        //                 Text(
        //                     // userName != null ? '$userName' :
        //                     'userNameGoogle',
        //                     style: const TextStyle(
        //                       fontWeight: FontWeight.w700,
        //                       fontSize: 18,
        //                     )),
        //                 Text(
        //                     // userEmail != null
        //                     //     ? '$userEmail'
        //                     //     :
        //                     'userEmailGoogle',
        //                     style: const TextStyle(
        //                       color: AppColor.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 14,
        //                     ))
        //               ],
        //             )
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //               color: AppColor.primary,
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 30, vertical: 14),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/icon_user.png',
        //                   height: 22,
        //                 ),
        //                 const SizedBox(
        //                   width: 13,
        //                 ),
        //                 const Text('Profile Saya ',
        //                     style: TextStyle(
        //                       color: AppColor.white,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 16,
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 6,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //               // color: AppColor.white,
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 30, vertical: 14),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/icon_list.png',
        //                   height: 22,
        //                 ),
        //                 const SizedBox(
        //                   width: 13,
        //                 ),
        //                 const Text('Bookmark ',
        //                     style: TextStyle(
        //                       color: AppColor.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 16,
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 6,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //               // color: AppColor.white,
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 30, vertical: 14),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/icon_call.png',
        //                   height: 22,
        //                 ),
        //                 const SizedBox(
        //                   width: 13,
        //                 ),
        //                 const Text('Customer Service ',
        //                     style: TextStyle(
        //                       color: AppColor.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 16,
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 6,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //               // color: AppColor.white,
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 30, vertical: 14),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/icon_about.png',
        //                   height: 22,
        //                 ),
        //                 const SizedBox(
        //                   width: 13,
        //                 ),
        //                 const Text('Tentang Kami ',
        //                     style: TextStyle(
        //                       color: AppColor.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 16,
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 6,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //               // color: AppColor.white,
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 30, vertical: 14),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/icon_setting.png',
        //                   height: 22,
        //                 ),
        //                 const SizedBox(
        //                   width: 13,
        //                 ),
        //                 const Text('Setting ',
        //                     style: TextStyle(
        //                       color: AppColor.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 16,
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 6,
        //         ),
        //         Material(
        //           color: AppColor.backgroundScaffold,
        //           borderRadius: BorderRadius.circular(10),
        //           child: InkWell(
        //             onTap: () {
        //               Session.clearUser();
        //               Navigator.pushReplacementNamed(context, AppRoute.signin);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 30, vertical: 14),
        //               child: Row(
        //                 children: [
        //                   Image.asset(
        //                     'assets/icon_logout.png',
        //                     height: 22,
        //                   ),
        //                   const SizedBox(
        //                     width: 13,
        //                   ),
        //                   const Text('Logout ',
        //                       style: TextStyle(
        //                         color: AppColor.grey,
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: 16,
        //                       )),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         )
        //       ],
        //     );
        //   }),
        // ),
        child: FutureBuilder<UserModel?>(
            future: futureUser,
            builder: (context, snapshot) {
              final futureUser = snapshot.data;
              if (snapshot.hasData) {
                var name = futureUser!.name;
                var email = futureUser.email;
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
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
                                Text(
                                    userNameGoogle != null
                                        ? '$userNameGoogle'
                                        : '$name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )),
                                Text(
                                    userEmailGoogle != null
                                        ? '$userEmailGoogle'
                                        : '$email',
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
                              logout();
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
                    ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      )),
    );
  }
}
