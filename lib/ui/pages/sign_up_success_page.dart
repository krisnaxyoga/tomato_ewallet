import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightBackgoundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akun Berhasil \n Terdaftar',
              style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Grow Your Finance Start \n Together with us',
              style: greyTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomsFilledButton(
              title: 'Get Started',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
