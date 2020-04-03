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

  Future updateTimesheet(TimesheetModel timesheet) async {
    return await timesheetCollection.document(uid).collection('mytimesheet').document(timesheet.docid).updateData({
      'date': timesheet.date,
      'project': timesheet.project,
      'process': timesheet.process,
      'taskType': timesheet.taskType,
      'taskNo': timesheet.taskNo,
      'description': timesheet.description,
      'timespent': timesheet.timeSpent,
      'status': timesheet.status
    }).catchError((onError){
      return onError.toString();
    });
  }

  Future deleteTimesheet(String docid) async {
    return await timesheetCollection.document(uid).collection('mytimesheet').document(docid).delete().catchError((onError){
      return onError.toString();
    });
  }

  List<TimesheetModel> _timesheetCollection(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return TimesheetModel(
        docid: doc.documentID ?? '',
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
        .where('date',isEqualTo: date)
        .snapshots()
        .map(_timesheetCollection);
  }
}
