import 'package:alphago/data/color_theme.dart';
import 'package:alphago/page/home.dart';
import 'package:flutter/material.dart';
import 'package:d_view/d_view.dart';
import 'package:d_info/d_info.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final LoginService _loginService = LoginService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool user = false;

  final formKey = GlobalKey<FormState>();
  login() async {
    if (formKey.currentState!.validate()) {
      //   UserModel? user = await _loginService.login(
      //     _emailController.text,
      //     _passwordController.text,
      //   );
      //   if (user != null) {
      //     successLoginDialog(context);
      //     // DInfo.dialogSuccess('Berhasil Login');
      //     DInfo.closeDialog(actionAfterClose: () {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (_) => Home(),
      //         ),
      //       );
      //     });
      //   } else {
      //     gagalLoginDialog(context);
      //     DInfo.closeDialog();
      //     // DInfo.dialogError('Gagal Login');
      //   }

      if (_emailController.text == 'user@gmail.com' &&
          _passwordController.text == '123') {
        DInfo.dialogSuccess(context, 'Berhasil Login');
        Future.delayed(const Duration(milliseconds: 1300), () {
          // Here you can write your code
          setState(() {
            // Here you can write your code for open new view
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          });
        });

        // DInfo.closeDialog(actionAfterClose: () {
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //       builder: (_) => HomePage(),
        //     ),
        //   );
        // });
      } else {
        DInfo.closeDialog(context);
        DInfo.dialogError(context, 'Gagal Login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
                    SizedBox(
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
                            SizedBox(
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
                                SizedBox(height: 4),
                                Text(
                                  'Happy to see you again, please login here',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColor.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Image.asset(
                            //   AppAsset.il_login,
                            //   height: 120,
                            // ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Email Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColor.dark),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _emailController,
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
                                labelStyle: TextStyle(color: AppColor.primary),
                                hintText: 'Enter your email address',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColor.dark),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _passwordController,
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
                                labelStyle: TextStyle(color: AppColor.primary),
                                hintText: 'Enter your password',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [SizedBox(height: 16)],
                                ),
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
                            SizedBox(height: 50),
                            Material(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () => login(),
                                // onTap: () {
                                //   Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //       builder: (context) => HomePage(),
                                //     ),
                                //   );
                                // },
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(
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
                              // Get.to(() => const DaftarPage());
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
                    SizedBox(
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
  }
}
