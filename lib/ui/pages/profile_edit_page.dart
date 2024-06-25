import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomsFormField(title: 'User Name'),
                const SizedBox(
                  height: 16,
                ),
                const CustomsFormField(title: 'Full Name'),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: EMAIL INPUT
                const CustomsFormField(title: 'Email Address'),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: PASSWORD INPUT
                const CustomsFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomsFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-edit-success', (route) => false);
                  },
                  height: 45,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
