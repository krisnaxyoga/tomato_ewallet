import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomsFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomsFilledButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: purpleColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56))),
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 15, fontWeight: medium),
        ),
      ),
    );
  }
}

class CustomsTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomsTextButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 24,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Text(
          title,
          style: greyTextStyle.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
