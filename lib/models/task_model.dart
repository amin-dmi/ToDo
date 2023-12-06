class TaskModel {
  String? taskTitle;
  String? taskSubtitle;
  bool? status;

  TaskModel({
    required this.status,
    required this.taskTitle,
    required this.taskSubtitle,
  });

  Map<String, dynamic> toJson() {
    return {
      "taskTitle": taskTitle,
      "taskSubtitle": taskSubtitle,
      "status": status
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskTitle = json["taskTitle"],
        taskSubtitle = json["taskSubtitle"],
        status = json["status"];
}
