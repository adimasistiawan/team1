class WorkloadClass {
  bool success;
  String code;
  List<Workload> data;

  WorkloadClass({this.success, this.code, this.data});

  WorkloadClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Workload>();
      json['data'].forEach((v) {
        data.add(new Workload.fromJson(v));
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

class Workload {
  int id;
  int userId;
  int companyId;
  int superiorId;
  String fullName;
  String position;
  String imageProfile;
  int totalTaskDone;
  int totalTask;
  int totalProgress;

  Workload(
      {this.id,
      this.userId,
      this.companyId,
      this.superiorId,
      this.fullName,
      this.position,
      this.imageProfile,
      this.totalTaskDone,
      this.totalTask,
      this.totalProgress});

  Workload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    superiorId = json['superior_id'];
    fullName = json['full_name'];
    position = json['position'];
    imageProfile = json['image_profile'];
    totalTaskDone = json['total_task_done'];
    totalTask = json['total_task'];
    totalProgress = json['total_progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['superior_id'] = this.superiorId;
    data['full_name'] = this.fullName;
    data['position'] = this.position;
    data['image_profile'] = this.imageProfile;
    data['total_task_done'] = this.totalTaskDone;
    data['total_task'] = this.totalTask;
    data['total_progress'] = this.totalProgress;
    return data;
  }
}
