import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_general/pagina_trabajos.dart';

class TrabajosPageController extends GetxController {
  RxList<Widget> _joblist = <Widget>[].obs;

  RxList<Widget> get joblist => _joblist;

  void addAddJobButton() {
    _joblist.add(IconButton(
      onPressed: () => {this.addJob()},
      icon: Icon(Icons.add),
    ));
  }

  void addJob() {
    _joblist.removeLast();
    _joblist.add(JobWidget(jobName: "Trabajo: ${_joblist.length}"));
    addAddJobButton();
  }
}
