class Summary {
  bool success;
  Data data;

  Summary({this.success, this.data});

  Summary.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  AccountInfo accountInfo;
  String strHealthCondition;
  bool healthUpdated;
  String greeting;
  String fullName;
  String positionName;
  Null superior;
  String imageProfileLink;
  String strTaskToday;
  String strDone;
  String strOutstanding;
  String strBacklog;
  List<ListAnn> listAnn;
  bool isAdmin;
  Company company;
  int approvalCount;

  Data(
      {this.accountInfo,
      this.strHealthCondition,
      this.healthUpdated,
      this.greeting,
      this.fullName,
      this.positionName,
      this.superior,
      this.imageProfileLink,
      this.strTaskToday,
      this.strDone,
      this.strOutstanding,
      this.strBacklog,
      this.listAnn,
      this.isAdmin,
      this.company,
      this.approvalCount});

  Data.fromJson(Map<String, dynamic> json) {
    accountInfo = json['accountInfo'] != null
        ? new AccountInfo.fromJson(json['accountInfo'])
        : null;
    strHealthCondition = json['strHealthCondition'];
    healthUpdated = json['healthUpdated'];
    greeting = json['greeting'];
    fullName = json['fullName'];
    positionName = json['positionName'];
    superior = json['superior'];
    imageProfileLink = json['imageProfileLink'];
    strTaskToday = json['strTaskToday'];
    strDone = json['strDone'];
    strOutstanding = json['strOutstanding'];
    strBacklog = json['strBacklog'];
    if (json['listAnn'] != null) {
      listAnn = new List<ListAnn>();
      json['listAnn'].forEach((v) {
        listAnn.add(new ListAnn.fromJson(v));
      });
    }
    isAdmin = json['isAdmin'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    approvalCount = json['approvalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accountInfo != null) {
      data['accountInfo'] = this.accountInfo.toJson();
    }
    data['strHealthCondition'] = this.strHealthCondition;
    data['healthUpdated'] = this.healthUpdated;
    data['greeting'] = this.greeting;
    data['fullName'] = this.fullName;
    data['positionName'] = this.positionName;
    data['superior'] = this.superior;
    data['imageProfileLink'] = this.imageProfileLink;
    data['strTaskToday'] = this.strTaskToday;
    data['strDone'] = this.strDone;
    data['strOutstanding'] = this.strOutstanding;
    data['strBacklog'] = this.strBacklog;
    if (this.listAnn != null) {
      data['listAnn'] = this.listAnn.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    data['approvalCount'] = this.approvalCount;
    return data;
  }
}

class AccountInfo {
  String fullName;
  int staffId;
  int companyId;
  int userId;

  AccountInfo({this.fullName, this.staffId, this.companyId, this.userId});

  AccountInfo.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    staffId = json['staff_id'];
    companyId = json['company_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['staff_id'] = this.staffId;
    data['company_id'] = this.companyId;
    data['user_id'] = this.userId;
    return data;
  }
}

class ListAnn {
  int id;
  int companyId;
  String colorCode;
  String title;
  String description;
  String expiredAt;
  String createdAt;
  String updatedAt;
  int priority;

  ListAnn(
      {this.id,
      this.companyId,
      this.colorCode,
      this.title,
      this.description,
      this.expiredAt,
      this.createdAt,
      this.updatedAt,
      this.priority});

  ListAnn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    colorCode = json['color_code'];
    title = json['title'];
    description = json['description'];
    expiredAt = json['expired_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['color_code'] = this.colorCode;
    data['title'] = this.title;
    data['description'] = this.description;
    data['expired_at'] = this.expiredAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['priority'] = this.priority;
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
  int memberCounter;
  String createdAt;
  String updatedAt;
  String logo;
  String adminName;
  String adminEmail;

  Company(
      {this.id,
      this.kodePerusahaan,
      this.companyName,
      this.address,
      this.contact,
      this.website,
      this.memberCounter,
      this.createdAt,
      this.updatedAt,
      this.logo,
      this.adminName,
      this.adminEmail});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodePerusahaan = json['kode_perusahaan'];
    companyName = json['company_name'];
    address = json['address'];
    contact = json['contact'];
    website = json['website'];
    memberCounter = json['member_counter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logo = json['logo'];
    adminName = json['admin_name'];
    adminEmail = json['admin_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_perusahaan'] = this.kodePerusahaan;
    data['company_name'] = this.companyName;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['website'] = this.website;
    data['member_counter'] = this.memberCounter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['logo'] = this.logo;
    data['admin_name'] = this.adminName;
    data['admin_email'] = this.adminEmail;
    return data;
  }
}
