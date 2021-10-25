import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_trabajo/job_widget.dart';

class WorkPageController extends GetxController {
  final RxList<Widget> _joblist = <Widget>[].obs;

  RxList<Widget> get joblist => _joblist;

  void addAddJobButton() {
    _joblist.add(IconButton(
      onPressed: () => {addJob()},
      icon: const Icon(Icons.add),
    ));
  }

  void addJob() {
    _joblist.removeLast();
    _joblist.add(JobWidget(jobName: "Trabajo: ${_joblist.length}"));
    addAddJobButton();
  }
}
