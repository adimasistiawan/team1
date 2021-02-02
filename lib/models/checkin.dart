class CheckinClass {
  bool success;
  String code;
  List<Checkin> data;

  CheckinClass({this.success, this.code, this.data});

  CheckinClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Checkin>();
      json['data'].forEach((v) {
        data.add(new Checkin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Checkin {
  int id;
  int userId;
  int companyId;
  int superiorId;
  String fullName;
  String imageProfile;
  Null checkin;

  Checkin(
      {this.id,
      this.userId,
      this.companyId,
      this.superiorId,
      this.fullName,
      this.imageProfile,
      this.checkin});

  Checkin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    superiorId = json['superior_id'];
    fullName = json['full_name'];
    imageProfile = json['image_profile'];
    checkin = json['checkin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['superior_id'] = this.superiorId;
    data['full_name'] = this.fullName;
    data['image_profile'] = this.imageProfile;
    data['checkin'] = this.checkin;
    return data;
  }
}
