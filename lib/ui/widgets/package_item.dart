import 'dart:ffi';

import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;
  const PackageItem({
    super.key,
    required this.dataPlan,
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
              '${dataPlan.name.toString()}',
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 32),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              formatCurrency(dataPlan.price ?? 0),
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
