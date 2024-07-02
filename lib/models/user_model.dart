class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.verified,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['tokrn'],
      );

  UserModel copywith({
    String? name,
    String? email,
    String? username,
    String? password,
    String? pin,
    int? balance,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        balance: balance ?? this.balance,
        verified: verified,
        profilePicture: profilePicture,
        cardNumber: cardNumber,
        token: token,
      );
}
