import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopupSelectBankItem extends StatelessWidget {
  // final String title;
  // final String subtitle;
  // final String imageUrl;
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  final VoidCallback? onTap;

  const TopupSelectBankItem({
    super.key,
    required this.paymentMethod,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border: Border.all(
            width: 2,
            color: isSelected ? blueColor : whiteColor,
          ),
        ),
        child: Row(
          children: [
            Image.network(
              paymentMethod.thumbnail.toString(),
              width: 90,
              height: 30,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  paymentMethod.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '50 mins',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
