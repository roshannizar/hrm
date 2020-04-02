class TimesheetModel {
  final String docid;
  final String date;
  final String project;
  final String process;
  final String taskType;
  final String taskNo;
  final String description;
  final String timeSpent;
  final String status;

  TimesheetModel(
      {this.docid,
      this.date,
      this.project,
      this.process,
      this.taskType,
      this.taskNo,
      this.description,
      this.timeSpent,
      this.status});
}
