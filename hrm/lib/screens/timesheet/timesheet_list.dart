import 'package:flutter/material.dart';
import 'package:hrm/models/timesheet_model.dart';
import 'package:hrm/screens/timesheet/timesheet_tile.dart';
import 'package:provider/provider.dart';

class TimesheetList extends StatefulWidget {
  @override
  _TimesheetListState createState() => _TimesheetListState();
}

class _TimesheetListState extends State<TimesheetList> {
  @override
  Widget build(BuildContext context) {
    final timesheets = Provider.of<List<TimesheetModel>>(context) ?? [];

    return timesheets.length == 0
        ? Container(
          alignment: Alignment.center,
            child: Image.asset('assets/norecordfound.png',fit: BoxFit.cover,),
          )
        : ListView.builder(
            itemCount: timesheets.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TimesheetTile(timesheetModel: timesheets[index]);
            },
          );
  }
}
