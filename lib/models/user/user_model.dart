class UserModel {
  String? sId;
  String? email;
  String? password;
  String? image;
  String? sex;
  String? pincode;
  String? address;
  String? city;
  String? state;
  String? country;
  String? bankAccountNumber;
  String? accountHolderName;
  String? ifscCode;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel({
    this.sId,
    this.email,
    this.password,
    this.image,
    this.sex,
    this.pincode,
    this.address,
    this.city,
    this.state,
    this.country,
    this.bankAccountNumber,
    this.accountHolderName,
    this.ifscCode,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    sex = json['sex'];
    pincode = json['pincode'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    bankAccountNumber = json['bank_account_number'];
    accountHolderName = json['account_holder_name'];
    ifscCode = json['ifsc_code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['sex'] = sex;
    data['pincode'] = pincode;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['bank_account_number'] = bankAccountNumber;
    data['account_holder_name'] = accountHolderName;
    data['ifsc_code'] = ifscCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
