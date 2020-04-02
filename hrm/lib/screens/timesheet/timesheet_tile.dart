import 'package:flutter/material.dart';
import 'package:hrm/models/timesheet_model.dart';

class TimesheetTile extends StatefulWidget {
  final TimesheetModel timesheetModel;
  TimesheetTile({this.timesheetModel});
  @override
  _TimesheetTileState createState() => _TimesheetTileState();
}

class _TimesheetTileState extends State<TimesheetTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Card(
        color: Colors.deepOrange,
        child: ListTile(
          title: Text('${widget.timesheetModel.project}'),
          subtitle: Text('vola vola'),
        ),
      ),
    );
  }
}
