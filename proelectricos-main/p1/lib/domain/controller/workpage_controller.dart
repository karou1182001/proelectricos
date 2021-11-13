import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_trabajo/job_widget.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// void main() async {
//   // Creates dir/ and dir/subdir/.
//   var directory = await Directory('dir/subdir').create(recursive: true)
//   print(directory.path);
// }
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<String> get _jobpath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path + '/jobs/';
}

class WorkPageController extends GetxController {
  final RxList<Widget> _joblist = <Widget>[].obs;

  RxList<Widget> get joblist => _joblist;

  int _jobcount = 0;
  Future<void> _verifyJobDirectory() async {
    // verifies that job directory exists.
    var jobsDirectory = Directory(await _jobpath);
    if (!await jobsDirectory.exists()) {
      // create it
      await jobsDirectory.create();
    }
  }

  Future<void> initController() async {
    await _verifyJobDirectory();
    // createNewJobDirectory(1);
    await _getExistingJobsDirectory();
    addAddJobButton();
  }

  //Esta función añade el botón que permite añadir nuevos trabajos
  void addAddJobButton() {
    if (_joblist.isNotEmpty) {
      if (_joblist.last is IconButton) {
        return;
      }
    }
    _joblist.add(IconButton(
      onPressed: () => {addJob()},
      icon: const Icon(Icons.add),
    ));
  }

  //Esta función te permite añadir nuevos trabajos a la lista de trabajo
  void addJob() async {
    _jobcount++;
    await _addJobToList();
    await _createNewJobDirectory(_jobcount);
  }

  Future<void> _addJobToList() async {
    if (_joblist.isNotEmpty) {
      if (_joblist.last is IconButton) {
        _joblist.removeLast();
      }
    }
    //Llamamos a JobWidget para añadir un nuevo botón de trabajo
    _joblist.add(JobWidget(
      jobName: "Trabajo: $_jobcount",
      jobNumber: _jobcount,
    ));
    //Esto añade el botón debajo de la lista
    addAddJobButton();
  }

  /* Folder structure is 
  jobs/|
       |-- job1/
              |
              |- formulario1.pdf
              |- formulario2.pdf
              .
              .
              .
       |---job2/
       |---job3/
       .
       .
       .
       */
  Future<void> _createNewJobDirectory(int job_number) async {
    var directory = await Directory(await _jobpath + 'job$job_number')
        .create(recursive: true);
  }

  Future<void> _getExistingJobsDirectory() async {
    // Reads and updates existing jobs for any previously stored jobs.
    // ONLY CALLED ON APPLICATION STARTUP
    var jobsDirectory = Directory(await _jobpath);
    await for (var entity
        in jobsDirectory.list(recursive: false, followLinks: false)) {
      print("Path: " + entity.path);
      _jobcount++;
      _addJobToList(); // add a job for each directory.
    }
  }
}
