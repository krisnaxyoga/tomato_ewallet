import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/data_form_model.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:bank_sha/ui/widgets/form.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;
  const DataPackagePage({super.key, required this.operatorCard});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
            print(state.e);
          }

          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    selectedDataPlan!.price! * -1,
                  ),
                );

            Navigator.pushNamedAndRemoveUntil(
                context, '/data-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Paket Data'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomsFormField(
                  title: '+628',
                  isShowTitle: false,
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Package',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Wrap(
                  spacing: 17,
                  runSpacing: 18,
                  children: widget.operatorCard.dataPlans!.map(
                    (dataPlan) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDataPlan = dataPlan;
                          });
                        },
                        child: PackageItem(
                          dataPlan: dataPlan,
                          isSelected: dataPlan.id == selectedDataPlan?.id,
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            floatingActionButton: (selectedDataPlan != null &&
                    phoneController.text.isNotEmpty)
                ? Container(
                    padding: const EdgeInsets.all(24),
                    child: CustomsFilledButton(
                      title: 'continue',
                      onPressed: () async {
                        if (await Navigator.pushNamed(context, '/pin') ==
                            true) {
                          final authState = context.read<AuthBloc>().state;
                          String pin = '';
                          if (authState is AuthSuccess) {
                            pin = authState.user.pin!;
                          }
                          context.read<DataPlanBloc>().add(
                                DataPlanPost(
                                  DataPlanFormModel(
                                    dataPlanId: selectedDataPlan!.id.toString(),
                                    phoneNumber: phoneController.text,
                                    pin: pin,
                                  ),
                                ),
                              );
                        }
                      },
                    ),
                  )
                : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
