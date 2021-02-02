class TeamviewClass {
  bool success;
  String code;
  List<TeamView> data;

  TeamviewClass({this.success, this.code, this.data});

  TeamviewClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<TeamView>();
      json['data'].forEach((v) {
        data.add(new TeamView.fromJson(v));
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

class TeamView {
  int id;
  int userId;
  int companyId;
  String position;
  String imageProfile;
  int superiorId;
  String fullName;
  String healthCondition;
  int healthSuhu;
  String healthStatus;
  Null healthLastUpdate;
  int totalTask;
  int totalTaskDone;
  bool wfhStatus;
  Null checkinLat;
  Null checkinLng;
  Null checkinLocationNote;
  Null checkinTime;

  TeamView(
      {this.id,
      this.userId,
      this.companyId,
      this.position,
      this.imageProfile,
      this.superiorId,
      this.fullName,
      this.healthCondition,
      this.healthSuhu,
      this.healthStatus,
      this.healthLastUpdate,
      this.totalTask,
      this.totalTaskDone,
      this.wfhStatus,
      this.checkinLat,
      this.checkinLng,
      this.checkinLocationNote,
      this.checkinTime});

  TeamView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    position = json['position'];
    imageProfile = json['image_profile'];
    superiorId = json['superior_id'];
    fullName = json['full_name'];
    healthCondition = json['health_condition'];
    healthSuhu = json['health_suhu'];
    healthStatus = json['health_status'];
    healthLastUpdate = json['health_last_update'];
    // if (json['current_condition'] != null) {
    //   currentCondition = new List<Null>();
    //   // json['current_condition'].forEach((v) {
    //   //   currentCondition.add(new Null.fromJson(v));
    //   // });
    // }
    // if (json['health_history'] != null) {
    //   healthHistory = new List<Null>();
    //   // json['health_history'].forEach((v) {
    //   //   healthHistory.add(new Null.fromJson(v));
    //   // });
    // }
    totalTask = json['total_task'];
    totalTaskDone = json['total_task_done'];
    wfhStatus = json['wfh_status'];
    checkinLat = json['checkin_lat'];
    checkinLng = json['checkin_lng'];
    checkinLocationNote = json['checkin_location_note'];
    checkinTime = json['checkin_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['position'] = this.position;
    data['image_profile'] = this.imageProfile;
    data['superior_id'] = this.superiorId;
    data['full_name'] = this.fullName;
    data['health_condition'] = this.healthCondition;
    data['health_suhu'] = this.healthSuhu;
    data['health_status'] = this.healthStatus;
    data['health_last_update'] = this.healthLastUpdate;
    data['total_task'] = this.totalTask;
    data['total_task_done'] = this.totalTaskDone;
    data['wfh_status'] = this.wfhStatus;
    data['checkin_lat'] = this.checkinLat;
    data['checkin_lng'] = this.checkinLng;
    data['checkin_location_note'] = this.checkinLocationNote;
    data['checkin_time'] = this.checkinTime;
    return data;
  }
}
