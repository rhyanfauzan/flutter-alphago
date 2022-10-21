import 'package:flutter/material.dart';

import '../data/color_theme.dart';

class KonsultasiPage extends StatelessWidget {
  const KonsultasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/maintenance.png',
                width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Kami akan memberi tahu anda ketika fitur ini sudah siap')
            ],
          ),
        ),
      ),
    );
  }
}
