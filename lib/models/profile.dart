class Profiles {
  bool success;
  String code;
  Profile data;

  Profiles({this.success, this.code, this.data});

  Profiles.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    data = json['data'] != null ? new Profile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Profile {
  int id;
  int userId;
  int companyId;
  Null position;
  Null superiorId;
  String fullName;
  String gender;
  String address;
  String phoneNumber;
  String dateOfBirth;
  String imageProfile;
  String createdAt;
  String updatedAt;
  String email;
  Company company;

  Profile(
      {this.id,
      this.userId,
      this.companyId,
      this.position,
      this.superiorId,
      this.fullName,
      this.gender,
      this.address,
      this.phoneNumber,
      this.dateOfBirth,
      this.imageProfile,
      this.createdAt,
      this.updatedAt,
      this.email,
      this.company});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    position = json['position'];
    superiorId = json['superior_id'];
    fullName = json['full_name'];
    gender = json['gender'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    imageProfile = json['image_profile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['position'] = this.position;
    data['superior_id'] = this.superiorId;
    data['full_name'] = this.fullName;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['image_profile'] = this.imageProfile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email'] = this.email;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    return data;
  }
}

class Company {
  int id;
  String kodePerusahaan;
  String companyName;
  String address;
  String contact;
  String website;
  String password;
  int memberCounter;
  int appStatus;
  int trialKuota;
  String createdAt;
  String updatedAt;
  String logo;

  Company(
      {this.id,
      this.kodePerusahaan,
      this.companyName,
      this.address,
      this.contact,
      this.website,
      this.password,
      this.memberCounter,
      this.appStatus,
      this.trialKuota,
      this.createdAt,
      this.updatedAt,
      this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodePerusahaan = json['kode_perusahaan'];
    companyName = json['company_name'];
    address = json['address'];
    contact = json['contact'];
    website = json['website'];
    password = json['password'];
    memberCounter = json['member_counter'];
    appStatus = json['app_status'];
    trialKuota = json['trial_kuota'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_perusahaan'] = this.kodePerusahaan;
    data['company_name'] = this.companyName;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['website'] = this.website;
    data['password'] = this.password;
    data['member_counter'] = this.memberCounter;
    data['app_status'] = this.appStatus;
    data['trial_kuota'] = this.trialKuota;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['logo'] = this.logo;
    return data;
  }
}
