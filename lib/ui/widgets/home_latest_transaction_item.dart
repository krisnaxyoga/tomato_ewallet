import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transactions;

  const HomeLatestTransactionItem({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          // transactions.transactionType?.thumbnail == null
          //     ? Image.asset(
          //         'asset/ic_upload.png',
          //         width: 40,
          //       )
          //     : Image.network(
          //         transactions.transactionType!.thumbnail!,
          //         width: 40,
          //       ),
          if (transactions.transactionType!.name.toString() == 'Transfer')
            Image.asset(
              'assets/ic_transaction_cat4.png',
              width: 40,
            ),
          if (transactions.transactionType!.name.toString() == 'Top Up')
            Image.asset(
              'assets/ic_transaction_cat1.png',
              width: 40,
            ),
          if (transactions.transactionType!.name.toString() == 'Internet')
            Image.asset(
              'assets/ic_transaction_cat5.png',
              width: 40,
            ),
          if (transactions.transactionType!.name.toString() == 'Withdraw')
            Image.asset(
              'assets/ic_transaction_cat3.png',
              width: 40,
            ),
          if (transactions.transactionType!.name.toString() == 'Cashback')
            Image.asset(
              'assets/ic_transaction_cat2.png',
              width: 40,
            ),
          const SizedBox(
            height: 18,
            width: 18,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactions.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd').format(
                    transactions.createdAt ?? DateTime.now(),
                  ),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(
              transactions.amount ?? 0,
              symbol:
                  transactions.transactionType?.action == 'cr' ? '+ ' : '- ',
            ),
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
