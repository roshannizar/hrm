import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrm/models/timesheet_model.dart';

class TimesheetService {
  final String date;
  final String uid;
  final CollectionReference timesheetCollection =
      Firestore.instance.collection('timesheet');

  TimesheetService({this.uid, this.date});

  Future newTimesheet(TimesheetModel timesheet) async {
    return await timesheetCollection
        .document(uid)
        .collection('mytimesheet')
        .add({
      'date': timesheet.date,
      'project': timesheet.project,
      'process': timesheet.process,
      'taskType': timesheet.taskType,
      'taskNo': timesheet.taskNo,
      'description': timesheet.description,
      'timespent': timesheet.timeSpent,
      'status': timesheet.status
    }).catchError((onError) {
      return onError.toString();
    });
  }

  List<TimesheetModel> _timesheetCollection(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return TimesheetModel(
          date: doc.data['date'] ?? '',
          project: doc.data['project'] ?? '',
          process: doc.data['process'] ?? '',
          taskType: doc.data['taskType'] ?? '',
          taskNo: doc.data['taskNo'] ?? '',
          description: doc.data['description'] ?? '',
          timeSpent: doc.data['timeSpent'] ?? '',
          status: doc.data['status'] ?? '');
    }).toList();
  }

  Stream<List<TimesheetModel>> get getTimesheet {
    return timesheetCollection
        .document(uid)
        .collection('mytimesheet')
        .snapshots()
        .map(_timesheetCollection);
  }
}
