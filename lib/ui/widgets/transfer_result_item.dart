import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultItem extends StatelessWidget {
  final String name;
  final String userName;
  final String imageUrl;
  final bool isVerified;
  const TransferResultItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.userName,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127,
      height: 171,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: whiteColor),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Text(
                  '@$userName',
                  style: greyTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
