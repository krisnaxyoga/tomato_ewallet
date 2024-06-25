import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:bank_sha/ui/widgets/topup_select_bank_item.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 55,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/img_wallet.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Angga Risky',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TopupSelectBankItem(
            title: 'Bank BCA',
            subtitle: '50 mins',
            imageUrl: 'assets/img_bank_bca.png',
            isSelected: true,
          ),
          const TopupSelectBankItem(
            title: 'Bank BNI',
            subtitle: '50 mins',
            imageUrl: 'assets/img_bank_bni.png',
          ),
          const TopupSelectBankItem(
            title: 'Bank MANDIRI',
            subtitle: '50 mins',
            imageUrl: 'assets/img_bank_mandiri.png',
          ),
          const TopupSelectBankItem(
            title: 'Bank OCBC',
            subtitle: '50 mins',
            imageUrl: 'assets/img_bank_ocbc.png',
          ),
          const SizedBox(
            height: 18,
          ),
          CustomsFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
