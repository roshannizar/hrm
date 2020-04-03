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
    final String status = widget.timesheetModel.status;

    return Container(
      width: 280,
      child: Card(
          color: Colors.blue[300],
          child: Column(
            children: <Widget>[
              ListTile(
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/view',arguments: widget.timesheetModel);
                  },
                  icon: Icon(Icons.remove_red_eye, color: Colors.white),
                ),
                title: Text('${widget.timesheetModel.project}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                subtitle: Text('${widget.timesheetModel.process}',
                    style: TextStyle(color: Colors.white)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Text('${widget.timesheetModel.taskType}',
                    style: TextStyle(color: Colors.white)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.date_range, color: Colors.white),
                  label: Text('${widget.timesheetModel.date}',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.panorama_fish_eye,
                      color: status == 'In Progress'
                          ? Colors.amber
                          : status == 'Completed'
                              ? Colors.green
                              : Colors.white),
                  label: Text('${widget.timesheetModel.status}',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          )),
    );
  }
}
