import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/topup/topup_bloc.dart';
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  final TopupFormModel data;
  const TopupAmountPage({super.key, required this.data});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(int.parse(text == '' ? '0' : text.replaceAll('.', ''))),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is TopupSuccess) {
              await launch(state.redirectUrl);

              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/topup-success', (route) => false);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Total Amount',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: amountController,
                            cursorColor: greyColor,
                            enabled: false,
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 30,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Text(
                                'Rp',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 30,
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: greyColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 66,
                      ),
                      Wrap(
                        runSpacing: 30,
                        spacing: 30,
                        children: [
                          CustomsInputButton(
                            title: '1',
                            onTap: () {
                              addAmount('1');
                            },
                          ),
                          CustomsInputButton(
                            title: '2',
                            onTap: () {
                              addAmount('2');
                            },
                          ),
                          CustomsInputButton(
                            title: '3',
                            onTap: () {
                              addAmount('3');
                            },
                          ),
                          CustomsInputButton(
                            title: '4',
                            onTap: () {
                              addAmount('4');
                            },
                          ),
                          CustomsInputButton(
                            title: '5',
                            onTap: () {
                              addAmount('5');
                            },
                          ),
                          CustomsInputButton(
                            title: '6',
                            onTap: () {
                              addAmount('6');
                            },
                          ),
                          CustomsInputButton(
                            title: '7',
                            onTap: () {
                              addAmount('7');
                            },
                          ),
                          CustomsInputButton(
                            title: '8',
                            onTap: () {
                              addAmount('8');
                            },
                          ),
                          CustomsInputButton(
                            title: '9',
                            onTap: () {
                              addAmount('9');
                            },
                          ),
                          const SizedBox(
                            width: 60,
                            height: 60,
                          ),
                          CustomsInputButton(
                            title: '0',
                            onTap: () {
                              addAmount('0');
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              deleteAmount();
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: numberBackgroundColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: whiteColor,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomsFilledButton(
                        title: 'Checkout Now',
                        onPressed: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            final authState = context.read<AuthBloc>().state;
                            String pin = '';
                            if (authState is AuthSuccess) {
                              pin = authState.user.pin!;
                            }
                            context.read<TopupBloc>().add(
                                  TopupPost(
                                    widget.data.copyWith(
                                      pin: pin,
                                      amount: amountController.text
                                          .replaceAll('.', ''),
                                    ),
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomsTextButton(
                        title: 'Terms & Conditions',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
