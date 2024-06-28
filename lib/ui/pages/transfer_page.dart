import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/transfer_result_item.dart';
import 'package:bank_sha/ui/widgets/transfer_user_recent_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomsFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // builtRecentUser(),
          builtResult(),
          const SizedBox(
            height: 274,
          ),
          CustomsFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

Widget builtRecentUser() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const TransferUserRecentItem(
          name: 'Yonna Jie',
          userName: 'yoenna',
          imgUrl: 'assets/img_friend1.png',
          isVerified: true,
        ),
        const TransferUserRecentItem(
          name: 'John Hi',
          userName: 'hji',
          imgUrl: 'assets/img_friend3.png',
          isVerified: false,
        ),
        const TransferUserRecentItem(
          name: 'Masayoshi',
          userName: 'form',
          imgUrl: 'assets/img_friend4.png',
          isVerified: false,
        )
      ],
    ),
  );
}

Widget builtResult() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const Wrap(
          spacing: 17,
          runSpacing: 17,
          children: [
            TransferResultItem(
              name: 'Yoen Kajja',
              userName: 'yoenna',
              imageUrl: 'assets/img_friend1.png',
              isVerified: true,
            ),
            TransferResultItem(
              name: 'Yoena Ka',
              userName: 'yoenna',
              imageUrl: 'assets/img_friend2.png',
              isVerified: false,
            )
          ],
        )
      ],
    ),
  );
}
