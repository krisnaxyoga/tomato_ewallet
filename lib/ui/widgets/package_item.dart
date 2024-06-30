import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  const PackageItem({
    super.key,
    required this.title,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      height: 171,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(
                  color: blueColor,
                  width: 2,
                )
              : null),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 32),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Rp $price',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
