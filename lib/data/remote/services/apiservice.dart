import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/controllers/profilecontroller.dart';
import 'package:myteam_2/data/remote/responses/response.dart';
import 'package:myteam_2/models/checkin.dart';
import 'package:myteam_2/models/company.dart';
import 'package:myteam_2/models/dashboard.dart';
import 'package:myteam_2/models/message.dart';
import 'package:myteam_2/models/messageerror.dart';
import 'package:myteam_2/models/profile.dart';
import 'package:myteam_2/models/structure.dart';
import 'package:myteam_2/models/summary.dart';
import 'package:myteam_2/models/teamview.dart';
import 'package:myteam_2/models/workload.dart';
import 'package:myteam_2/ui/pages/login.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/company.dart';
import 'package:myteam_2/ui/pages/successinfo.dart';
import 'package:myteam_2/ui/pages/verificationinfo.dart';
import 'package:myteam_2/ui/pages/navbarbottom.dart';
import 'package:myteam_2/utils/constant.dart';
import 'package:myteam_2/ui/pages/profile/profile.dart' as Page;
import 'package:get/get.dart';
import 'package:myteam_2/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

shared() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token');
  return token;
}

class ApiService {
  final String baseUrl = "http://172.104.161.39/myteam/public/api";

  Future<Summary> getSummary() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/home/summary",
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().summaryFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<ListAnn> createAnnouncement(ListAnn ann) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.post("$baseUrl/my-company/announcement", body: {
      'company_id': "14",
      'color_code': ann.colorCode,
      'title': ann.title,
      'description': ann.description,
      'expired_at': ann.expiredAt,
      'priority': "1"
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token
    });
    print(response.body);
    if (response.statusCode == 200) {
      return Responses().annFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Profiles> getProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/myprofile/get-profile",
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Profiles> editProfile(Profile profile) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.post("$baseUrl/myprofile/edit-profile", body: {
      'name': profile.fullName,
      'phone': profile.phoneNumber,
      'address': profile.address,
      'birthday': profile.dateOfBirth,
      'gender': profile.gender
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token
    });
    print(response.body);
    if (response.statusCode == 200) {
      HomeController _homecontroller = Get.put(HomeController());
      _homecontroller.getData();
      return Responses().profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<void> changeImgProfile(File img) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    var url = "$baseUrl/myprofile/update-image-profile";
    var request = await http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('attachment', img.path));
    request.headers
        .addAll({'Accept': 'application/json', 'Authorization': token});
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("Uploaded!");
        Get.back();
        Get.back();
        HomeController _homecontroller = Get.put(HomeController());
        ProfileController _profileController = Get.put(ProfileController());
        _homecontroller.getData();
        _profileController.getData();
      } else {
        print("Gagal");
      }
    });
  }

  Future<Message> changePassword(
      String oldpass, String newpass, String connewpass) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response =
        await http.post("$baseUrl/myprofile/change-password", body: {
      'current_password': oldpass,
      'new_password': newpass,
      'new_password_confirmation': connewpass,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token
    });
    print(response.body);
    if (response.statusCode == 200) {
      print('Success');
      return Responses().messageFromJson(response.body);
    } else {
      print("Fail");
      return Responses().messageFromJson(response.body);
    }
  }

  Future<CompanyClass> getCompanyProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/my-company/profile",
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().companyFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Message> editCompany(CompanyProfile company) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response =
        await http.post("$baseUrl/my-company/profile/update", body: {
      'company_name': company.companyName,
      'address': company.address,
      'contact': company.contact,
      'website': company.website
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token
    });
    print(response.body);
    if (response.statusCode == 200) {
      print('Success');
      return Responses().messageFromJson(response.body);
    } else {
      print("Fail");
      return Responses().messageFromJson(response.body);
    }
  }

  Future<void> changeImgLogo(File img) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    var url = "$baseUrl/my-company/profile/change-logo";
    var request = await http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('image_logo', img.path));
    request.headers
        .addAll({'Accept': 'application/json', 'Authorization': token});
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("Uploaded!");
        Get.back();
        Get.back();
        Get.back();
        Get.to(CompanyPage());
      } else {
        print("Gagal");
      }
    });
  }

  Future<Message> changePasswordCompany(
      String oldpass, String newpass, String connewpass) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response =
        await http.post("$baseUrl/my-company/profile/change-password", body: {
      'current_password': oldpass,
      'new_password': newpass,
      'new_password_confirmation': connewpass,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token
    });
    print(response.body);
    if (response.statusCode == 200) {
      print('Success');
      return Responses().messageFromJson(response.body);
    } else {
      print("Fail");
      return Responses().messageFromJson(response.body);
    }
  }

  Future<StructureClass> getStructure() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    ProfileController _profileController = Get.put(ProfileController());
    final response = await http.get(
        "$baseUrl/my-company/structure/child?staff_id=" +
            _profileController.data.value.id.toString(),
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().structureFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Dashboard> getDashboard() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/dashboard/summary",
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().dashboardFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<TeamviewClass> getTeamview() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/team-view/get-all-team",
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().teamviewFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<WorkloadClass> getWorkload() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/team-view/get-all-team",
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      return Responses().workloadFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CheckinClass> getCheckin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.get("$baseUrl/team-view/checkin-log",
        headers: {'Accept': 'application/json', 'Authorization': token});
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Responses().checkinFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<LoginClass> login(String username, String password) async {
    final response =
        await http.post("$baseUrl/users/guest/login/default", body: {
      'username': username,
      'password': password,
    }, headers: {
      'Accept': 'application/json',
    });
    print(response.body);
    if (response.statusCode == 200) {
      print('Success');
      return Responses().loginFromJson(response.body);
    } else {
      print("Fail");
      return null;
    }
  }

  Future<MessageError> register(
      String username, String email, String password) async {
    final response = await http.post("$baseUrl/users/guest/register", body: {
      'username': username,
      'password': password,
      'email': email
    }, headers: {
      'Accept': 'application/json',
      'Content': 'application/x-www-form-urlencoded'
    });
    if (response.statusCode == 200) {
      print('Success');
      Get.offAll(Verification());
    } else {
      print("Fail");
      return Responses().errorFromJson(response.body);
    }
  }

  Future<Message> createCompany(CompanyProfile company) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.post("$baseUrl/welcome/company/create", body: {
      'company_name': company.companyName,
      'address': company.address,
      'contact': company.contact,
      'website': company.website,
      'password': company.password
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token
    });
    print(response.body);
    if (response.statusCode == 200) {
      print('Success');
      return Responses().messageFromJson(response.body);
    } else {
      print("Fail");
      return Responses().messageFromJson(response.body);
    }
  }

  Future<Message> joinCompany(String company_code, String password) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.post("$baseUrl/welcome/company/join",
        body: {'company_kode': company_code, 'password': password},
        headers: {'Accept': 'application/json', 'Authorization': token});

    if (response.statusCode == 200) {
      print('Success');
      return Get.offAll(NavbarBottom());
    } else {
      return Responses().messageFromJson(response.body);
    }
  }

  Future<Message> forgetPassword(String email) async {
    final response = await http.post("$baseUrl/users/guest/password/forgot",
        body: {'email': email}, headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      print('Success');
      return Get.offAll(SuccessInfo());
    } else {
      return Responses().messageFromJson(response.body);
    }
  }

  Future<Message> invite(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    final response = await http.post("$baseUrl/welcome/company/invite",
        body: {'email': email},
        headers: {'Accept': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      print('Success');
      return Responses().messageFromJson(response.body);
    } else {
      Get.dialog(AlertDialog(
        content: Text("Failed"),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ));
    }
  }
}
