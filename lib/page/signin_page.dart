import 'package:alphago/page/register_page.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:alphago/config/app_route.dart';
import 'package:alphago/source/user_source.dart';

import '../config/app_color.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      UserSource.signIn(controllerEmail.text, controllerPassword.text)
          .then((response) {
        if (response['success']) {
          DInfo.dialogSuccess(context, response['message']);
          DInfo.closeDialog(context, actionAfterClose: () {
            Navigator.pushReplacementNamed(context, AppRoute.home);
          });
        } else {
          DInfo.toastError(response['message']);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.grey.shade800),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, Welcome Back! ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.grey.shade800),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Happy to see you again, please login here',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColor.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Image.asset(
                            //   AppAsset.il_login,
                            //   height: 120,
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Email Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColor.dark),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: controllerEmail,
                              validator: (value) =>
                                  value == '' ? 'Email harus diisi' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  // borderSide: BorderSide.,
                                ),
                                labelStyle:
                                    const TextStyle(color: AppColor.primary),
                                hintText: 'Enter your email address',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColor.dark),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: controllerPassword,
                              validator: (value) =>
                                  value == '' ? 'Password harus diisi' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              style: const TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  // borderSide: BorderSide.none,
                                ),
                                labelStyle:
                                    const TextStyle(color: AppColor.primary),
                                hintText: 'Enter your password',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: () {
                                    // Get.to(() => const LupaKs());
                                  },
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        color: AppColor.orange,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 50),
                            Material(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () => login(context),
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 16),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account? ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RegisterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register ',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: LayoutBuilder(builder: (context, constraints) {
    //       return SingleChildScrollView(
    //         child: ConstrainedBox(
    //           constraints: BoxConstraints(
    //             minHeight: constraints.maxHeight,
    //           ),
    //           child: Form(
    //             key: formKey,
    //             child: Padding(
    //               padding: const EdgeInsets.all(16),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     AppAsset.logo,
    //                     width: 180,
    //                     fit: BoxFit.fitWidth,
    //                   ),
    //                   const SizedBox(height: 80),
    //                   Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: Text(
    //                       'Sign In\nTo Your Account',
    //                       style:
    //                           Theme.of(context).textTheme.titleLarge!.copyWith(
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 20),
    //                   TextFormField(
    //                     controller: controllerEmail,
    //                     validator: (value) =>
    //                         value == '' ? "Don't empty" : null,
    //                     decoration: InputDecoration(
    //                       isDense: true,
    //                       filled: true,
    //                       fillColor: Colors.white,
    //                       contentPadding: const EdgeInsets.symmetric(
    //                           horizontal: 16, vertical: 16),
    //                       hintText: 'Email Address',
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                       ),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                         borderSide:
    //                             const BorderSide(color: AppColor.secondary),
    //                       ),
    //                       enabledBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                         borderSide: BorderSide.none,
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 20),
    //                   TextFormField(
    //                     controller: controllerPassword,
    //                     obscureText: true,
    //                     validator: (value) =>
    //                         value == '' ? "Don't empty" : null,
    //                     decoration: InputDecoration(
    //                       isDense: true,
    //                       filled: true,
    //                       fillColor: Colors.white,
    //                       contentPadding: const EdgeInsets.symmetric(
    //                           horizontal: 16, vertical: 16),
    //                       hintText: 'Password',
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                       ),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                         borderSide:
    //                             const BorderSide(color: AppColor.secondary),
    //                       ),
    //                       enabledBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                         borderSide: BorderSide.none,
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 30),
    //                   ButtonCustom(
    //                     label: 'Sign In',
    //                     isExpand: true,
    //                     onTap: () => login(context),
    //                   ),
    //                   const SizedBox(height: 24),
    //                   const Text(
    //                     'Create new Account',
    //                     style: TextStyle(color: Colors.grey),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     }),
    //   ),
    // );
  }
}
