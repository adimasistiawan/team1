class CompanyClass {
  bool success;
  String code;
  CompanyProfile data;

  CompanyClass({this.success, this.code, this.data});

  CompanyClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    data =
        json['data'] != null ? new CompanyProfile.fromJson(json['data']) : null;
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

class CompanyProfile {
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
  String adminName;
  String logoUrl;
  String strRegisterPackage;
  String strActive;
  String strValidUntil;
  String strLastPaymentIdr;
  String strSubPackage;

  CompanyProfile(
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
      this.logo,
      this.adminName,
      this.logoUrl,
      this.strRegisterPackage,
      this.strActive,
      this.strValidUntil,
      this.strLastPaymentIdr,
      this.strSubPackage});

  CompanyProfile.fromJson(Map<String, dynamic> json) {
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
    adminName = json['admin_name'];
    logoUrl = json['logo_url'];
    strRegisterPackage = json['strRegisterPackage'];
    strActive = json['strActive'];
    strValidUntil = json['strValidUntil'];
    strLastPaymentIdr = json['strLastPaymentIdr'];
    strSubPackage = json['strSubPackage'];
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
    data['admin_name'] = this.adminName;
    data['logo_url'] = this.logoUrl;
    data['strRegisterPackage'] = this.strRegisterPackage;
    data['strActive'] = this.strActive;
    data['strValidUntil'] = this.strValidUntil;
    data['strLastPaymentIdr'] = this.strLastPaymentIdr;
    data['strSubPackage'] = this.strSubPackage;
    return data;
  }
}
