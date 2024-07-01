import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:flutter/material.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetProfilePage({
    super.key,
    required this.data,
  });

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    // print(data.toJson());
    return Scaffold(
      // backgroundColor: lightBackgoundColor,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(
                top: 100,
                bottom: 100,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img_logo_light.png',
                  ),
                ),
              ),
            ),
            Text(
              'Join Us to Unlock\nYour Growth',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgoundColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_upload.png',
                        width: 32,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: AssetImage('assets/img_profile.png'),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Shayna Hanna',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomsFormField(
                    title: 'Set PIN (6 digit number)',
                    obscureText: true,
                    controller: pinController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomsFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up-set-ktp');
                    },
                    height: 45,
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
  }
}
