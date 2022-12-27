abstract class TaskamoDateTime {
  static DateTime getStartOfMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month);
  }

  static DateTime getEndOfMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month +1, 0);
  }
}
