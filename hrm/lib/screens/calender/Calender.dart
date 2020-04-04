import 'package:flutter/material.dart';
import 'package:hrm/models/timesheet_model.dart';
import 'package:hrm/screens/timesheet/timesheet_list.dart';
import 'package:hrm/services/timesheet_service.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  final String uid;
  Calender({this.uid});
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarController _calendarController;
  String selectedDate =
      '${DateTime.now().year}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().day.toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TimesheetModel>>.value(
      value: TimesheetService(uid: widget.uid, date: selectedDate).getTimesheet,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: TableCalendar(
                onDaySelected: (date, events) {
                  setState(() {
                    selectedDate =
                        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
                  });
                },
                calendarController: _calendarController,
              ),
            ),
            Container(height: 200, child: TimesheetList())
          ],
        ),
      ),
    );
  }
}
