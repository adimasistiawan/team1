import 'package:flutter/material.dart';
import 'package:flutter_treeview/tree_view.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/structurecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class StructurePage extends StatefulWidget {
  @override
  _StructurePageState createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  StructureController _structureController = Get.put(StructureController());
  TreeViewTheme _treeViewTheme = TreeViewTheme(
    expanderTheme: ExpanderThemeData(
      type: ExpanderType.arrow,
      modifier: ExpanderModifier.none,
      position: ExpanderPosition.start,
      color: black,
      size: 20,
    ),
    labelStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 0.3,
    ),
    parentLabelStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w800,
      color: blue,
    ),
    iconTheme: IconThemeData(
      size: 18,
      color: Colors.grey.shade800,
    ),
    colorScheme: ColorScheme.light(),
  );
  @override
  Widget build(BuildContext context) {
    return Obx(() => _structureController.tree == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            resizeToAvoidBottomPadding: true,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: black, //change your color here
              ),
              backgroundColor: Colors.white,
              title: Text(
                "Structure",
                style: textBlack2,
              ),
            ),
            body: ListView(
              children: [
                Container(
                  height: 300,
                  padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: TreeView(
                    controller: _structureController.tree.value,
                    theme: _treeViewTheme,
                    // onNodeTap: (key) {
                    //   Node selectedNode = _treeViewController.getNode(key);
                    // },
                  ),
                ),
              ],
            ),
          ));
  }
}
