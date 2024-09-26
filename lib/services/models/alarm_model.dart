import 'package:hive_flutter/hive_flutter.dart';
part 'alarm_model.g.dart';
@HiveType(typeId: 0)
class ModelAlarm extends HiveObject{
  @HiveField(0)
final String content;
  @HiveField(1)
  final String period;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String history;
  ModelAlarm({required this.content, required this.period, required this.time, required this.history});
}
//flutter packages pub run build_runner build