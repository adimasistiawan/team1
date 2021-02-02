import 'package:flutter_treeview/tree_view.dart';
import 'package:flutter_treeview/tree_view.dart' as Nodes;
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:myteam_2/controllers/companycontroller.dart';
import 'package:myteam_2/controllers/profilecontroller.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/structure.dart';

class StructureController extends GetxController {
  var data = List<Structure>().obs;
  var tree = TreeViewController().obs;

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  getData() async {
    await ApiService().getStructure().then((value) {
      var child = List<Nodes.Node>();
      var nodes = List<Nodes.Node>();
      ProfileController _profileController = Get.put(ProfileController());
      value.data.forEach((element) {
        child.add(Nodes.Node(key: element.fullName, label: element.fullName));
      });
      nodes.add(Nodes.Node(
          key: "Me (" + _profileController.data.value.fullName + ")",
          label: "Me (" + _profileController.data.value.fullName + ")",
          children: child));
      tree.value = TreeViewController(children: nodes);
    });
  }
}
