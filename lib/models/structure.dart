class StructureClass {
  bool success;
  String code;
  List<Structure> data;

  StructureClass({this.success, this.code, this.data});

  StructureClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Structure>();
      json['data'].forEach((v) {
        data.add(new Structure.fromJson(v));
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

class Structure {
  int id;
  int userId;
  int companyId;
  String position;
  int superiorId;
  String fullName;
  String gender;
  String address;
  String phoneNumber;
  String dateOfBirth;
  String imageProfile;
  Null healthCondition;
  Null wfhStatus;
  Null totalTask;
  Null totalTaskDone;
  String createdAt;
  String updatedAt;

  Structure(
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
      this.healthCondition,
      this.wfhStatus,
      this.totalTask,
      this.totalTaskDone,
      this.createdAt,
      this.updatedAt});

  Structure.fromJson(Map<String, dynamic> json) {
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
    healthCondition = json['health_condition'];
    wfhStatus = json['wfh_status'];
    totalTask = json['total_task'];
    totalTaskDone = json['total_task_done'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['health_condition'] = this.healthCondition;
    data['wfh_status'] = this.wfhStatus;
    data['total_task'] = this.totalTask;
    data['total_task_done'] = this.totalTaskDone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
