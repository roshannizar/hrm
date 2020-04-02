import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:hrm/models/timesheet_model.dart';
import 'package:hrm/models/user_model.dart';
import 'package:hrm/services/timesheet_service.dart';
import 'package:hrm/shared/loading.dart';
import 'package:intl/intl.dart';

class NewTimesheet extends StatefulWidget {
  @override
  _NewTimesheetState createState() => _NewTimesheetState();
}

class _NewTimesheetState extends State<NewTimesheet> {
  final format = DateFormat('y/MM/d');
  bool loading = false;
  String project,
      taskType,
      process,
      status,
      datetime,
      description,
      taskNo,
      timeSpent;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UserModel args = ModalRoute.of(context).settings.arguments;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title:
                  Text('New Timesheet', style: TextStyle(color: Colors.black)),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        DateTimeField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Date',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          format: format,
                          validator: (val) => val == null ? '*' : null,
                          onChanged: (value) {
                            datetime = DateFormat('y/MM/d').format(value);
                          },
                          onShowPicker: (context, currentValue) {
                            setState(() {
                              datetime = DateFormat('y/MM/d')
                                  .format(currentValue ?? DateTime.now());
                            });
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                        SizedBox(height: 10),
                        InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Projects',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              hint: Text('-- Please select a project --'),
                              value: project,
                              items: <String>[
                                'Car Wash',
                                'Bus Booking',
                                'Assocify',
                                'CFS',
                                'PAW LOYALTY'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  project = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Process',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              hint: Text('-- Please select a process --'),
                              value: process,
                              items: <String>[
                                'Pre-Sales',
                                'Analysis',
                                'Planning',
                                'Design and Development',
                                'Testing',
                                'Implementation and support',
                                'Training',
                                'Common'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  process = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Task Type',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              hint: Text('-- Please select a task type --'),
                              value: taskType,
                              items: <String>[
                                'SDS',
                                'Development',
                                'UI/UX Design',
                                'Bug Fixing',
                                'Date import',
                                'R & D',
                                'Tech Support'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  taskType = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Task Number',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          validator: (val) => val.isEmpty ? '*' : null,
                          onChanged: (value) {
                            setState(() {
                              taskNo = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Description',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          validator: (val) => val.isEmpty ? '*' : null,
                          onChanged: (value) {
                            setState(() {
                              description = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Time spent',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          validator: (val) => val.isEmpty ? '*' : null,
                          onChanged: (value) {
                            timeSpent = value;
                          },
                        ),
                        SizedBox(height: 10),
                        InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200])),
                              labelText: 'Task Status',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              hint: Text('-- Choose a status --'),
                              value: status,
                              items: <String>[
                                'In - Progress',
                                'Completed',
                                'On Hold',
                                'Cancelled'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  status = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: FlatButton.icon(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });

                        var timesheet = TimesheetModel(
                            date: datetime,
                            project: project,
                            process: process,
                            description: description,
                            status: status,
                            taskNo: taskNo,
                            taskType: taskType,
                            timeSpent: timeSpent);
                        try {
                          await TimesheetService(uid: args.email)
                              .newTimesheet(timesheet);

                          setState(() {
                            loading = false;
                          });

                          Navigator.pop(context);
                        } catch (e) {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      icon: Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      label: Text('CREATE',
                          style: TextStyle(color: Colors.white))),
                ),
                SizedBox(height: 10)
              ],
            ));
  }
}
