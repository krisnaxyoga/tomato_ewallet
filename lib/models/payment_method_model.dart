class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? status;

  PaymentMethodModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.status,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      thumbnail: json['thumbnail'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'thumbnail': thumbnail,
      'status': status,
    };
  }
}
