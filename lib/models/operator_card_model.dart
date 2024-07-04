import 'package:bank_sha/models/data_plan_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thubnail;
  final List<DataPlanModel>? dataPlans;

  OperatorCardModel({
    this.id,
    this.name,
    this.dataPlans,
    this.status,
    this.thubnail,
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) =>
      OperatorCardModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thubnail: json['thumbnail'],
        dataPlans: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataPlan) => DataPlanModel.fromJson(dataPlan))
                .toList(),
      );
}
