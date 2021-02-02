import 'dart:convert';

import 'package:myteam_2/models/checkin.dart';
import 'package:myteam_2/models/company.dart';
import 'package:myteam_2/models/dashboard.dart';
import 'package:myteam_2/models/message.dart';
import 'package:myteam_2/models/messageerror.dart';
import 'package:myteam_2/models/profile.dart';
import 'package:myteam_2/models/summary.dart';
import 'package:myteam_2/models/structure.dart';
import 'package:myteam_2/models/teamview.dart';
import 'package:myteam_2/models/workload.dart';
import 'package:myteam_2/models/login.dart';

class Responses {
  Summary summaryFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return Summary.fromJson(data);
  }

  Profiles profileFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return Profiles.fromJson(data);
  }

  ListAnn annFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return ListAnn.fromJson(data);
  }

  Message messageFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return Message.fromJson(data);
  }

  CompanyClass companyFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return CompanyClass.fromJson(data);
  }

  StructureClass structureFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return StructureClass.fromJson(data);
  }

  Dashboard dashboardFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return Dashboard.fromJson(data);
  }

  TeamviewClass teamviewFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return TeamviewClass.fromJson(data);
  }

  WorkloadClass workloadFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return WorkloadClass.fromJson(data);
  }

  CheckinClass checkinFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return CheckinClass.fromJson(data);
  }

  LoginClass loginFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return LoginClass.fromJson(data);
  }

  MessageError errorFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return MessageError.fromJson(data);
  }
}
