import 'package:alphago/config/app_color.dart';
import 'package:alphago/config/app_route.dart';
import 'package:alphago/controller/c_user.dart';
import 'package:alphago/model/user.dart';
import 'package:alphago/source/user_source.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? idUser;
  bool user = false;

  final formKey = GlobalKey<FormState>();
  register() async {
    if (formKey.currentState!.validate()) {
      try {
        // menambahkan user ke auth firebase
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  tambahDataUser() async {
    if (formKey.currentState!.validate()) {
      try {
        // menambahkan user ke firestore
        final dtBaru = UserModel(
            id: idUser,
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text);
        UserSource.registerUser(item: dtBaru);
        print('berhasil, dtBaru: ${dtBaru}');

        // pindah halaman setelah berhasil
        DInfo.dialogSuccess(context, 'Berhasil Daftar!');
        DInfo.closeDialog(context, actionAfterClose: () {
          Navigator.pushReplacementNamed(context, AppRoute.signin);
        });
      } catch (e) {
        print(e);
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
            child: GetBuilder<CUser>(builder: (_) {
              return SingleChildScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(25),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(25),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Image.asset(
                                        'assets/ic_back.png',
                                        width: 40,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Register',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.grey.shade800),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi, Welcome! ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Colors.grey.shade800),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Let’s create your account',
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

                              const Text(
                                'Username',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColor.dark),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _nameController,
                                validator: (value) =>
                                    value == '' ? 'Username harus diisi' : null,
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
                                  hintText: 'Enter Username',
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
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
                              const SizedBox(height: 4),
                              const Text(
                                'Your password must be at least 6 characters',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColor.grey),
                              ),
                              const SizedBox(height: 16),
                              // const Text(
                              //   'Confirm Password',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 15,
                              //       color: AppColor.dark),
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // TextFormField(
                              //   controller: _passwordController,
                              //   validator: (value) =>
                              //       value == '' ? 'Password harus diisi' : null,
                              //   autovalidateMode:
                              //       AutovalidateMode.onUserInteraction,
                              //   obscureText: true,
                              //   style: const TextStyle(color: Colors.grey),
                              //   decoration: InputDecoration(
                              //     fillColor: Colors.white,
                              //     filled: true,
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       // borderSide: BorderSide.none,
                              //     ),
                              //     labelStyle:
                              //         const TextStyle(color: AppColor.primary),
                              //     hintText: 'Enter your password',
                              //     isDense: true,
                              //     contentPadding: const EdgeInsets.symmetric(
                              //       horizontal: 20,
                              //       vertical: 16,
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(height: 4),
                              // const Text(
                              //   'Your password must be at least 6 characters',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w400,
                              //       fontSize: 12,
                              //       color: AppColor.grey),
                              // ),

                              const SizedBox(height: 50),
                              Material(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                    register();
                                    tambahDataUser();
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 16),
                                        child: Text(
                                          'Register',
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
                              'Already have an account? ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Login ',
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
              );
            }),
          );
        },
      ),
    );
  }
}
