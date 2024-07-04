class DataPlanFormModel {
  final String? dataPlanId;
  final String? phoneNumber;
  final String? pin;

  DataPlanFormModel({
    this.dataPlanId,
    this.phoneNumber,
    this.pin,
  });

  Map<String, dynamic> toJson() => {
        'data_plan_id': dataPlanId,
        'phone_number': phoneNumber,
        'pin': pin,
      };
}
