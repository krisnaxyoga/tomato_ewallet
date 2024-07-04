import 'package:bank_sha/models/tip_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final TipModel tip;

  const HomeTipsItem({
    super.key,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(tip.url!)) {
          launch(tip.url!);
        }
      },
      child: Container(
        width: 127,
        height: 176,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                tip.thumbnail!,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                tip.title!,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
